# example-github-actions

[![test](https://github.com/0Tech/example-github-actions/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/0Tech/example-github-actions/actions/workflows/test.yml)
[![nightly](https://github.com/0Tech/example-github-actions/actions/workflows/publish.yml/badge.svg?event=schedule)](https://github.com/0Tech/example-github-actions/actions/workflows/publish.yml)

## Usage

You have to pull the Docker image or you can build one on your own. Please refer to Build section if you want to build your image.

You can, for example, evaluate 1 + 1 as below:
```sh
docker run ghcr.io/0tech/example-github-actions 1 + 1
```


## Build

### Linux

You need to install the required packages before the following step. If you have no idea or want to maintain your environment clean, I recommend you to use Docker.

This project uses CMake, so you can build it as below:

```sh
cmake -S . -B build
cmake --build build
```

### Docker

You need to install Docker first. And build the image as below:

```sh
docker build -t example-github-actions --target final .
```
