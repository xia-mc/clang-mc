import shutil
import subprocess
from pathlib import Path

from internal import *


def initialize():
    assert Const.BUILD_DIR.exists()
    assert Const.BUILD_BIN_DIR.exists()
    FileUtils.ensureDirectoryNotExist(Path(Const.BUILD_BIN_DIR, "assets"))
    FileUtils.ensureDirectoryNotExist(Path(Const.BUILD_BIN_DIR, "include"))
    FileUtils.ensureDirectoryEmpty(Const.BUILD_TMP_DIR)


def main():
    initialize()

    # 拷贝基本stdlib
    print("Copying runtime assets to bin...")
    shutil.copytree(Path(Const.RESOURCES_DIR, "assets"), Path(Const.BUILD_BIN_DIR, "assets"))
    shutil.copytree(Path(Const.RESOURCES_DIR, "include"), Path(Const.BUILD_BIN_DIR, "include"))

    # 编译stdlib
    print("Compiling stdlib...")
    sources: list[str] = []
    for item in Const.MCASM_DIR.iterdir():
        if item.suffix != ".mcasm":
            continue
        sources.append(f'"{item.absolute()}"')
    process = subprocess.Popen(
        [str(Const.EXECUTABLE), "--compile-only", "--namespace", "std:__internal", "--build-dir", str(Const.BUILD_TMP_DIR)] + sources,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        encoding="UTF-8",
        bufsize=1,
        universal_newlines=True
    )
    print(f"Compile command: {' '.join(process.args)}")
    for out in process.communicate():
        if out is None or len(out) == 0:
            continue
        print(out.strip())

    # 拷贝stdlib
    print("Copying stdlib to bin...")
    shutil.copytree(Const.BUILD_TMP_DIR, Path(Const.BUILD_BIN_DIR, "assets/stdlib"), dirs_exist_ok=True)


if __name__ == '__main__':
    main()
