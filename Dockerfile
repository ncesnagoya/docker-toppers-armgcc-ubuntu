FROM ubuntu:xenial

LABEL maintainer "Mitsutaka Takada <mtakada@nces.i.nagoya-u.ac.jp>"
LABEL description="GNU ARM:7-2018-q2, QEMU:TOPPERS-ContributedSoftware/qemu stable-2.12_toppers, on Ubuntu(xenial)"

ENV PACKAGES \
    wget bzip2 flex bison git subversion python ruby gcc pkg-config zlib1g-dev libglib2.0-dev libpixman-1-dev
RUN apt-get update \
    && apt-get -y install $PACKAGES \
    && dpkg -l $PACKAGES | sort > /packages.txt

WORKDIR /work

RUN wget -O gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2 https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2?revision=bc2c96c0-14b5-4bb4-9f18-bceb4050fee7?product=GNU-RM%20Downloads,64-bit,,Linux,7-2018-q2-update \
    && echo '299ebd3f1c2c90930d28ab82e5d8d6c0 gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2' | md5sum -c \
    && tar xjf gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2 \
    && cp -r gcc-arm-none-eabi-7-2018-q2-update/* /usr/local/

RUN git clone https://github.com/TOPPERS-ContributedSoftware/qemu \
    && cd qemu \
    && git submodule init \
    && git submodule update --recursive \
    && git checkout stable-2.12_toppers \
    && mkdir build ; cd build \
    && ../configure --target-list=arm-softmmu --prefix=/opt/qemu-arm-softmmu \
    && make -j4 ;make install

WORKDIR /
RUN rm -rf /work
ENV PATH $PATH:/opt/qemu-arm-softmmu/bin
RUN arm-none-eabi-gcc --version \
    && qemu-system-arm --version
