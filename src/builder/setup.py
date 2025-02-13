import shutil
import sys
from pathlib import Path


def check_tool(name: str, command: str) -> bool:
    """检查指定工具是否安装"""
    if shutil.which(command) is None:
        print(f"[错误] 未找到 {name} ({command})，请先安装。")
        return False
    return True


def ensureSetup() -> None:
    """
    检查构建所需的环境是否安装正确，如果未安装正确就退出构建脚本
    """
    required_tools = [
        ("CMake", "cmake")
    ]

    missing_tools = [name for name, cmd in required_tools if not check_tool(name, cmd)]

    if missing_tools:
        print("\n[错误] 以下工具未安装，无法继续构建：")
        for tool in missing_tools:
            print(f"  - {tool}")
        sys.exit(1)


PROJECT_FOLDER = Path(__file__).parent.parent.parent


def ensureFolder(path: Path) -> None:
    if path.exists() and path.is_dir():
        shutil.rmtree(path)
    path.mkdir()


def ensureBuildFolder() -> None:
    folder = Path(PROJECT_FOLDER, "build")
    ensureFolder(folder)
    ensureFolder(Path(folder, "sources"))
    ensureFolder(Path(folder, "libs"))
