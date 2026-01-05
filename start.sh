docker run --mount source=lede_source,target=/source --mount type=bind,source=$PWD,target=/local --net=host -it lede-compiler
