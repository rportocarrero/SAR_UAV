# This is a dockerfile for setting up the build tools for Zephr
# pull from ubuntu
FROM ubuntu:focal 

# install sudo command
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install sudo \
    cmake \
    g++ \
    git
RUN export CC=/usr/bin/gcc
RUN export CXX=/usr/bin/g++

# Select and Update OS
RUN sudo apt update
RUN sudo apt -y upgrade

COPY ./zephyr_install.sh /
RUN chmod 777 zephyr_install.sh