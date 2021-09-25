FROM ubuntu:20.04

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends openssl libssl-dev git g++ make cmake libssl-dev
RUN apt-get install --reinstall ca-certificates

RUN mkdir -p /poco
COPY poco_install.sh /poco/

WORKDIR /poco
RUN /poco/poco_install.sh

RUN mkdir -p /glog
WORKDIR /glog
RUN git clone https://github.com/google/glog.git && \
cd glog && \
cmake -S . -B build -G "Unix Makefiles" && \
cmake --build build && \
cmake --build build --target install

WORKDIR /