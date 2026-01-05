FROM ubuntu:24.04
COPY sources.list* /etc/apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y build-essential clang flex bison g++ gawk \
gcc-multilib g++-multilib gettext git libncurses5-dev libssl-dev \
python3-setuptools rsync swig unzip zlib1g-dev file wget golang

COPY container.sh /
RUN chmod +x /container.sh

ENTRYPOINT ./container.sh
