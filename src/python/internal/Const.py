import platform
from pathlib import Path

PROJECT_DIR = Path(__file__).absolute().parent.parent.parent.parent
BUILD_DIR = Path(PROJECT_DIR, "build").absolute()
BUILD_BIN_DIR = Path(BUILD_DIR, "bin").absolute()
BUILD_TMP_DIR = Path(BUILD_DIR, "tmp").absolute()

EXECUTABLE = Path(BUILD_BIN_DIR, "clang-mc.exe" if platform.system() == "Windows" else "clang-mc").absolute()

MCASM_DIR = Path(PROJECT_DIR, "src/mcasm").absolute()
RESOURCES_DIR = Path(PROJECT_DIR, "src/resources").absolute()
