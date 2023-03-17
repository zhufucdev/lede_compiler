FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
COPY sources.list /etc/apt/sources.list
RUN apt update -y && apt install -y ack antlr3 aria2 asciidoc autoconf automake autopoint binutils bison build-essential \
  bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib-mips-linux-gnu g++-multilib-mips-linux-gnu \
  git gperf haveged help2man intltool libc6-dev libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
  libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
  mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip libpython3-dev qemu-utils \
  rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev golang

ENTRYPOINT cd /source && \
  git init && \
  git remote set-url --add origin https://github.com/coolsnowwolf/lede && \
  git fetch && \
  ./scripts/feeds update -a && \
  ./scripts/feeds update -a && \
  ./scripts/feeds install -a && \
  make menuconfig && \
  make download -j8 && \
  FORCE_UNSAFE_CONFIGURE=1 make V=s -j8 && \
  cp -r bin/targets /local
