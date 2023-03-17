# LEDE Compiler

This is a Dockerfile repo to make a compiling image
for a well-known OpenWrt fork

## How to Use

I am too lazy to publish the image to docker hub, so
please run build yourself

### Build image

```shell
git clone https://github.com/zhufucdev/lede_compiler
cd ./lede_compiler
./build.sh
```
This creates an image tagged `lede-compiler` on your machine

If you would like to use some Ubuntu mirrors, put that shit in `./sources.list`
so that it can be copied

The base image in use is Ubuntu 22.04. Depends on what mirror
you like, the concrete configuration may change

### Configuration

To start configurating and building, run

```shell
./start.sh
```

This will bring up a mkconfig menu

The current directory is mounted to `/local`.
Feel free to use your predefined configurations

### Compilation

Exit the menu to start compiling

It's docker, so there should be no dependency issue. 
Even if there are, I believe you are capable of fixing them yourself

### Apple Silicon

This image is veried on Apple Silicon only, but should be
compatible with x86 or other architect machines

As far as I am concerned, the `golang` toolchain is broken
unless specified as the system one in the `.config` file
```ini
CONFIG_GOLANG_EXTERNAL_BOOTSTRAP_ROOT="/usr/bin/go"
```

### Output

With no issue raised, compile result will be copied to a
`./bin/targets` directory