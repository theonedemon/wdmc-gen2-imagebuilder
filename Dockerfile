FROM ubuntu:xenial
MAINTAINER theonedemon <theonedemon@gmail.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

ENV ARCH arm
ENV CROSS_COMPILE arm-linux-gnueabihf-

RUN apt-get update \
	&& apt-get install -y \
	xz-utils curl wget apt-utils git

RUN apt-get install -y \
	build-essential bc gcc-arm-linux-gnueabihf u-boot-tools

WORKDIR /root/data

#CMD ["/bin/bash", "-l"]