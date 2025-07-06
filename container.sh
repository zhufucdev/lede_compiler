cd /source
if [ ! -d .git ]
then
    git clone -b openwrt-24.10 --single-branch --filter=blob:none https://github.com/immortalwrt/immortalwrt .
else
    git fetch
fi
./scripts/feeds update -a
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
make download -j8
FORCE_UNSAFE_CONFIGURE=1 make V=s -j8
cp -r bin/targets /local