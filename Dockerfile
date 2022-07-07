# This is a dockerfile for setting up the build tools for Zephr
# pull from ubuntu
FROM ubuntu:focal 

# install sudo command
RUN apt-get update
RUN apt-get -y install sudo

# Select and Update OS
RUN sudo apt update
RUN sudo apt -y upgrade

COPY ./zephyr_install.sh /
RUN chmod 777 zephyr_install.sh