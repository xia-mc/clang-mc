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


if __name__ == '__main__':
    main()
