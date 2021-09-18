# Simple Dockerfile for purpose of compiling binaries using poco inside docker container.
### example command to build it would be:
`docker build --no-cache --tag poco_builder .`

### and later usage of it could look like that:
```
FROM poco_builder AS builder

RUN mkdir -p /build/src
COPY ./src /build/src

WORKDIR /build
RUN mkdir bin
RUN ls ./src
RUN g++ -std=c++2a src/main.cpp -o bin/server -lPocoFoundation -lPocoUtil -lPocoNet
```