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

### Output

With no issue raised, compile result will be copied to a
`./bin/targets` directory