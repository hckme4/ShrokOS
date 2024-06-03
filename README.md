# ShrokOS
OS Development!


## The Build Environment
To use the build environment, you will need docker, and run `docker run -it --rm $(docker build -q .)` to use the shell.
This will launch an interactive shell with the complete i686-elf-gcc toolchain courtesy of user kevincharm: [https://github.com/kevincharm/i686-elf-gcc-toolchain](https://github.com/kevincharm/i686-elf-gcc-toolchain)

From here, i686-elf-gcc and grub-mkrescue are made available in an ubuntu shell for building.
