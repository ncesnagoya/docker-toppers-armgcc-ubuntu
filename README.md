# ARM target development environment for TOPPERS 3rd generation kernels

## How to use
```
docker pull toppers-armgcc-ubuntu:7-2018-q2
docker run --rm -it toppers-armgcc-ubuntu:7-2018-q2
```

## Host OS
- Ubuntu(xenial)

## Toolchain
- [GNU ARM Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm)
    - [7-2018-q2](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads/7-2018-q2-update)

## Target OS Simulator
- [QEMU](https://github.com/TOPPERS-ContributedSoftware/qemu)(github)
    - stable-2.12 (Multi-core supported)


## How to Docker Build
```
docker build -t toppersjp/ttsp-armgcc-ubuntu:0.1 .
```
## Install Packages
- bison bzip2 flex gcc git libglib2.0-dev libpixman-1-dev pkg-config python ruby subversion wget zlib1g-dev:amd64

See `/packages.txt` on Docker container. You can get more information.

## About TOPPERS kernel
https://www.toppers.jp/project.html (in Japanese)
