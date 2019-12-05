FROM toppersjp/armgcc-ubuntu:7-2018-q2

LABEL maintainer "Mitsutaka Takada <mtakada@nces.i.nagoya-u.ac.jp>"
LABEL description="Base Docker image: toppersjp/armgcc-ubuntu"

ENV PACKAGES \
    vim ruby-dev libncurses5-dev libncursesw5-dev expect
RUN apt-get update \
    && apt-get -y install $PACKAGES \
    && dpkg -l $PACKAGES | sort > /packages.txt \
    && gem install curses

WORKDIR /home

RUN arm-none-eabi-gcc --version \
    && qemu-system-arm --version \
    && expect -version
