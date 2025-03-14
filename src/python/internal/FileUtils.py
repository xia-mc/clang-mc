import shutil
from pathlib import Path


def ensureDirectoryExist(directory: Path) -> bool:
    """确保目录存在，返回值为是否创建的新目录"""
    if directory.exists():
        return False

    parent = directory.parent
    if parent is not directory:
        ensureDirectoryExist(parent)
    directory.mkdir()
    return True


def ensureDirectoryEmpty(directory: Path) -> None:
    """确保目录存在，并为空"""
    if ensureDirectoryExist(directory):
        return

    shutil.rmtree(directory)
    directory.mkdir()


def ensureDirectoryNotExist(directory: Path) -> None:
    if not directory.exists():
        return

    shutil.rmtree(directory)
