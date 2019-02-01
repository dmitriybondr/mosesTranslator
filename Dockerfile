FROM ubuntu:16.04

MAINTAINER Dmitriy Korol "dmitriybondr@gmail.com"

# base tools
RUN apt-get update
RUN apt-get install -y \
   unzip \
   build-essential \
   wget \
   g++ \
   git \
   subversion \
   automake \
   libtool \
   zlib1g-dev \
   libboost-all-dev \
   libbz2-dev \
   liblzma-dev \
   python-dev \
   graphviz \
   imagemagick \
   make \
   cmake \
   libgoogle-perftools-dev \
   autoconf \
   doxygen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8

RUN mkdir -p /home/moses
WORKDIR /home/moses
RUN wget http://www.statmt.org/moses/RELEASE-4.0/binaries/ubuntu-16.04.tgz
RUN tar -zxvf ./ubuntu-16.04.tgz

RUN git clone https://github.com/moses-smt/giza-pp.git
RUN cd giza-pp; make
