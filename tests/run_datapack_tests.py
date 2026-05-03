from __future__ import annotations

import argparse
import shutil
import socket
import struct
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


@dataclass(frozen=True)
class Case:
    name: str
    source: str
    opt: str = "-O0"
    expected_rax: int = 0
    expected_rsp: int = 16384
    wait_seconds: int = 20


ROOT = Path(__file__).resolve().parents[1]
TEST_DIR = ROOT / "tests"
CASE_DIR = TEST_DIR / "cases"
RUN_DIR = ROOT / "run"
TMP_DIR = RUN_DIR / "tmp-test-suite"
SERVER_DIR = RUN_DIR / "server"
WORLD_DATAPACKS = SERVER_DIR / "world" / "datapacks"
ACTIVE_PACK = WORLD_DATAPACKS / "a.zip"
ACTIVE_DIR_PACK = WORLD_DATAPACKS / "file"
BIN_DIR = ROOT / "build" / "bin"

CLANG = BIN_DIR / ("clang.exe" if sys.platform == "win32" else "clang")
ASM = BIN_DIR / ("clang-mc.exe" if sys.platform == "win32" else "clang-mc")

ERROR_PATTERNS = (
    "Command execution stopped",
    "Aborted",
    "crashed",
    "Exception",
    "ERROR",
    "Error",
)

CASES: list[Case] = [
    Case("libc_printf_o0", "libc_printf.c"),
    Case("loop_mix_o0", "loop_mix.c"),
    Case("recursion_factorial_o0", "recursion_factorial.c"),
    Case("mutual_recursion_o0", "mutual_recursion.c"),
    Case("float_arith_o0", "float_arith.c"),
    Case("float_ieee754_sum_o0", "float_ieee754_sum.c"),
    Case("function_pointer_direct_o0", "function_pointer_direct.c"),
    Case("function_pointer_basic_o0", "function_pointer_basic.c"),
    Case("float_format_o0", "float_format.c"),
    Case("o3_behavior_o0", "o3_behavior.c", "-O0"),
    Case("o3_behavior_o3", "o3_behavior.c", "-O3"),
]


class RconClient:
    def __init__(self, host: str, port: int, password: str) -> None:
        self.host = host
        self.port = port
        self.password = password
        self._request_id = 1

    def command(self, command: str) -> str:
        with socket.create_connection((self.host, self.port), timeout=5) as sock:
            sock.settimeout(5)
            self._send_packet(sock, self._request_id, 3, self.password)
            packet_id, packet_type, payload = self._recv_packet(sock)
            if packet_id == -1 or packet_type != 2:
                raise RuntimeError("RCON auth failed")

            self._request_id += 1
            self._send_packet(sock, self._request_id, 2, command)
            packet_id, _, payload = self._recv_packet(sock)
            if packet_id != self._request_id:
                raise RuntimeError("RCON response id mismatch")
            return payload

    @staticmethod
    def _send_packet(sock: socket.socket, packet_id: int, packet_type: int, payload: str) -> None:
        payload_bytes = payload.encode("utf-8")
        body = struct.pack("<ii", packet_id, packet_type) + payload_bytes + b"\x00\x00"
        sock.sendall(struct.pack("<i", len(body)) + body)

    @staticmethod
    def _recv_packet(sock: socket.socket) -> tuple[int, int, str]:
        raw_len = RconClient._recv_exact(sock, 4)
        (length,) = struct.unpack("<i", raw_len)
        body = RconClient._recv_exact(sock, length)
        packet_id, packet_type = struct.unpack("<ii", body[:8])
        payload = body[8:-2].decode("utf-8", errors="replace")
        return packet_id, packet_type, payload

    @staticmethod
    def _recv_exact(sock: socket.socket, size: int) -> bytes:
        chunks = bytearray()
        while len(chunks) < size:
            chunk = sock.recv(size - len(chunks))
            if not chunk:
                raise RuntimeError("RCON connection closed")
            chunks.extend(chunk)
        return bytes(chunks)


def parse_server_properties(path: Path) -> dict[str, str]:
    props: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        props[key] = value
    return props


def run_logged(command: list[str], log_path: Path, cwd: Path) -> None:
    with log_path.open("w", encoding="utf-8") as log:
        proc = subprocess.run(command, cwd=cwd, stdout=log, stderr=subprocess.STDOUT, text=True)
    if proc.returncode != 0:
        raise RuntimeError(f"command failed: {' '.join(command)} -> {log_path}")


def stop_existing_server_processes() -> None:
    if sys.platform != "win32":
        return
    cmd = (
        "Get-CimInstance Win32_Process | "
        "Where-Object { $_.Name -like 'java*' -and $_.CommandLine -like '*run\\\\server*server.jar*' } | "
        "ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue }"
    )
    subprocess.run(["powershell", "-Command", cmd], check=False, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)


def cleanup_active_pack() -> None:
    if ACTIVE_PACK.exists():
        ACTIVE_PACK.unlink()
    if ACTIVE_DIR_PACK.exists():
        shutil.rmtree(ACTIVE_DIR_PACK, ignore_errors=True)


def wait_for_rcon(client: RconClient, timeout_seconds: int = 120) -> bool:
    deadline = time.time() + timeout_seconds
    while time.time() < deadline:
        time.sleep(1)
        try:
            client.command("list")
            return True
        except Exception:
            pass
    return False


def start_server(stdout_log: Path, stderr_log: Path) -> subprocess.Popen[str]:
    creationflags = getattr(subprocess, "CREATE_NO_WINDOW", 0)
    stdout_handle = stdout_log.open("w", encoding="utf-8")
    stderr_handle = stderr_log.open("w", encoding="utf-8")
    proc = subprocess.Popen(
        ["java", "-Xmx1G", "-Xms512M", "-jar", "server.jar", "nogui"],
        cwd=SERVER_DIR,
        stdout=stdout_handle,
        stderr=stderr_handle,
        text=True,
        creationflags=creationflags,
    )
    proc._stdout_handle = stdout_handle  # type: ignore[attr-defined]
    proc._stderr_handle = stderr_handle  # type: ignore[attr-defined]
    return proc


def stop_server(proc: subprocess.Popen[str] | None, client: RconClient) -> None:
    try:
        client.command("stop")
        time.sleep(5)
    except Exception:
        pass

    if proc is not None:
        try:
            proc.wait(timeout=10)
        except subprocess.TimeoutExpired:
            proc.kill()
            proc.wait(timeout=10)
        finally:
            getattr(proc, "_stdout_handle", None) and proc._stdout_handle.close()  # type: ignore[attr-defined]
            getattr(proc, "_stderr_handle", None) and proc._stderr_handle.close()  # type: ignore[attr-defined]

    stop_existing_server_processes()


def score(client: RconClient, name: str) -> int:
    output = client.command(f"scoreboard players get {name} vm_regs")
    marker = " has "
    tail = " [vm_regs]"
    if marker not in output or tail not in output:
        raise RuntimeError(f"unexpected scoreboard output: {output!r}")
    start = output.index(marker) + len(marker)
    end = output.index(tail, start)
    return int(output[start:end].strip())


def scan_logs(paths: Iterable[Path]) -> list[str]:
    hits: list[str] = []
    for path in paths:
        if not path.exists():
            continue
        for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
            if any(pattern in line for pattern in ERROR_PATTERNS):
                hits.append(line)
    return hits


def compile_case(case: Case) -> Path:
    case_dir = TMP_DIR / case.name
    case_dir.mkdir(parents=True, exist_ok=True)
    pack_build = case_dir / "pack-build"
    if pack_build.exists():
        shutil.rmtree(pack_build)

    mcasm_path = case_dir / f"{case.name}.mcasm"
    clang_log = case_dir / "clang.log"
    asm_log = case_dir / "asm.log"

    run_logged(
        [str(CLANG), str(CASE_DIR / case.source), "-target", "mcasm", case.opt, "-S", "-o", str(mcasm_path)],
        clang_log,
        ROOT,
    )
    run_logged(
        [str(ASM), str(mcasm_path), "-N", "a", "-B", str(pack_build), "-o", str(case_dir / "pack.zip")],
        asm_log,
        ROOT,
    )
    return case_dir / "pack.zip.zip"


def run_case(case: Case, pack_zip: Path, client: RconClient) -> tuple[bool, str]:
    cleanup_active_pack()
    case_dir = TMP_DIR / case.name
    stdout_log = TMP_DIR / f"{case.name}.server.log"
    stderr_log = TMP_DIR / f"{case.name}.server.err.log"
    for path in (stdout_log, stderr_log):
        if path.exists():
            path.unlink()

    server_proc = start_server(stdout_log, stderr_log)
    try:
        if not wait_for_rcon(client):
            return False, "RCON not ready"

        client.command("gamerule maxCommandChainLength 10000000")
        client.command("player CodexBot spawn")
        shutil.copy2(pack_zip, ACTIVE_PACK)
        client.command("reload")
        time.sleep(case.wait_seconds)

        rax = score(client, "rax")
        rsp = score(client, "rsp")
        log_hits = scan_logs((stdout_log, stderr_log))

        if rax != case.expected_rax:
            return False, f"rax={rax}, expected={case.expected_rax}"
        if rsp != case.expected_rsp:
            return False, f"rsp={rsp}, expected={case.expected_rsp}"
        if log_hits:
            return False, "log errors: " + " | ".join(log_hits[:3])
        return True, f"rax={rax} rsp={rsp}"
    finally:
        stop_server(server_proc, client)
        cleanup_active_pack()


def main() -> int:
    parser = argparse.ArgumentParser(description="Run clang-mc datapack runtime regression cases.")
    parser.add_argument("--case", dest="case_filter", help="Run only cases whose name contains this substring.")
    parser.add_argument("--keep-tmp", action="store_true", help="Keep run/tmp-test-suite after completion.")
    args = parser.parse_args()

    props = parse_server_properties(SERVER_DIR / "server.properties")
    client = RconClient(
        props.get("server-ip") or "127.0.0.1",
        int(props.get("rcon.port", "25575")),
        props["rcon.password"],
    )

    selected = [case for case in CASES if not args.case_filter or args.case_filter in case.name]
    if not selected:
        print("没有匹配的测试用例。", file=sys.stderr)
        return 2

    stop_existing_server_processes()
    if TMP_DIR.exists():
        shutil.rmtree(TMP_DIR)
    TMP_DIR.mkdir(parents=True, exist_ok=True)

    try:
        compiled: dict[str, Path] = {}
        keep_tmp = args.keep_tmp
        for case in selected:
            print(f"[compile] {case.name}")
            compiled[case.name] = compile_case(case)

        failures: list[tuple[str, str]] = []
        for case in selected:
            print(f"[run] {case.name}")
            ok, detail = run_case(case, compiled[case.name], client)
            status = "PASS" if ok else "FAIL"
            print(f"{status} {case.name}: {detail}")
            if not ok:
                failures.append((case.name, detail))

        if failures:
            keep_tmp = True
            print("\n失败汇总:")
            for name, detail in failures:
                print(f"- {name}: {detail}")
            print(f"\n调试产物保留在: {TMP_DIR}")
            return 1

        print("\n全部测试通过。")
        return 0
    finally:
        if not keep_tmp and TMP_DIR.exists():
            shutil.rmtree(TMP_DIR, ignore_errors=True)


if __name__ == "__main__":
    raise SystemExit(main())
