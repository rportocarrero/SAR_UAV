# This is a dockerfile for setting up the build tools for Zephr
# pull from ubuntu
FROM ubuntu:focal 

# update packages
RUN apt-get -y update && apt-get -y upgrade

# install timezone data
RUN apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteratctive tzdata

# install needed programsdocker 
RUN apt-get -y install sudo \
    cmake \
    g++ \
    git \
    python
RUN export CC=/usr/bin/gcc
RUN export CXX=/usr/bin/g++

# Select and Update OS
RUN sudo apt update
RUN sudo apt -y upgrade

COPY ./zephyr_install.sh /
RUN chmod 777 zephyr_install.sh