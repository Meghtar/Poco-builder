FROM ubuntu:20.04

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends openssl libssl-dev git g++ make cmake libssl-dev
RUN apt-get install --reinstall ca-certificates

RUN mkdir -p /poco
COPY poco_install.sh /poco/

WORKDIR /poco
RUN /poco/poco_install.sh

WORKDIR /