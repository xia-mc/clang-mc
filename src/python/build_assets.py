import os
import shutil
import subprocess
from pathlib import Path

from internal import *


def initialize():
    if os.name != "nt":
        raise EnvironmentError("Currectly, Only Windows is supported.")

    assert Const.BUILD_DIR.exists()
    assert Const.BUILD_BIN_DIR.exists()
    FileUtils.ensureDirectoryNotExist(Path(Const.BUILD_DIR, "assets"))
    FileUtils.ensureDirectoryNotExist(Path(Const.BUILD_DIR, "include"))
    FileUtils.ensureDirectoryEmpty(Const.BUILD_TMP_DIR)


def getPrettyCmd(command):
    return ' '.join(map(lambda s: f'"{s}"' if " " in s else s, map(str, command)))


def getVCVars64():
    vswhere_path = r"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe"
    if not os.path.isfile(vswhere_path):
        vswhere_path = "vswhere.exe"

    try:
        cmd = [
            vswhere_path,
            "-latest",
            "-products", "*",
            "-requires", "Microsoft.VisualStudio.Component.VC.Tools.x86.x64",
            "-property", "installationPath"
        ]
        vs_path = subprocess.check_output(cmd, encoding="utf-8").strip()
        if vs_path:
            vcvars_path = os.path.join(vs_path, "VC", "Auxiliary", "Build", "vcvars64.bat")
            if os.path.isfile(vcvars_path):
                return vcvars_path

        return "vcvars64.bat"
    except Exception:
        return None


def main():
    initialize()

    # 拷贝基本stdlib
    print("Copying runtime assets to bin...")
    shutil.copytree(Path(Const.RESOURCES_DIR, "assets"), Path(Const.BUILD_DIR, "assets"))
    shutil.copytree(Path(Const.RESOURCES_DIR, "include"), Path(Const.BUILD_DIR, "include"))

    # 编译stdlib
    print("Compiling stdlib...")
    sources: set[str] = {str((Const.MCASM_DIR / "stdlib.mcasm").absolute())}
    for item in Const.MCASM_DIR.iterdir():
        if item.suffix != ".mcasm":
            continue
        sources.add(str(item.absolute()))
    command = [str(Const.EXECUTABLE), "--compile-only", "--namespace", "std:_internal", "--build-dir", str(Const.BUILD_TMP_DIR)]
    command.extend(sources)
    print(f"Compile command: {getPrettyCmd(command)}")
    process = subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        encoding="UTF-8",
        bufsize=1,
        universal_newlines=True
    )
    for out in process.communicate():
        if out is None or len(out) == 0:
            continue
        print(out.strip())

    # 拷贝stdlib
    print("Copying stdlib...")
    shutil.copytree(Const.BUILD_TMP_DIR, Path(Const.BUILD_DIR, "assets/stdlib"), dirs_exist_ok=True)

    print("Cleaning...")
    shutil.rmtree(Path(Const.BUILD_DIR, "tmp"))

    # 编译LLVM
    print("Compiling LLVM...")
    command = ["cmd", "/c", getVCVars64(), "&&", "compile_windows.bat"]
    print(f"Compile command: {getPrettyCmd(command)}")
    process = subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        encoding="GBK",
        bufsize=1,
        universal_newlines=True,
        cwd=Const.LLVM_DIR
    )
    for out in process.communicate():
        if out is None or len(out) == 0:
            continue
        print(out.strip())

    # 拷贝clang
    print("Copying clang...")
    shutil.copyfile(Path(Const.LLVM_DIR, "build/bin/clang.exe"), Path(Const.BUILD_DIR, "bin/clang.exe"))


if __name__ == '__main__':
    main()
