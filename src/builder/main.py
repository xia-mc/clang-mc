from src.builder import setup


def main():
    setup.ensureSetup()
    setup.ensureBuildFolder()


if __name__ == '__main__':
    main()
