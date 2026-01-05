#!/bin/bash

cd /source
if [ ! -d .git ]
then
    git clone -b openwrt-25.12 --single-branch --filter=blob:none https://github.com/immortalwrt/immortalwrt .
else
    git pull
fi
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
make deconf download -j8
FORCE_UNSAFE_CONFIGURE=1 make V=s -j8
cp -r bin/targets /local
