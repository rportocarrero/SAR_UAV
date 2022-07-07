#!/bin/bash -i
set -e
#install wget tool(needed for installing kitware) and tzdata(needed for installing dependencies) 
apt-get -y install wget
apt-get -y install tzdata

#Install dependencies (kitware archive requires Ubuntu 16.04, 18.04 or 20.04)
wget https://apt.kitware.com/kitware-archive.sh
sudo bash kitware-archive.sh

sudo apt install -y --no-install-recommends git cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget \
  python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
  make gcc gcc-multilib g++-multilib libsdl2-dev

#Get zephyr and install python dependencies
pip3 install --user -U west
echo 'export PATH=~/.local/bin:"$PATH"' >> ~/.bashrc
source ~/.bashrc

west init ~/zephyrproject
cd ~/zephyrproject
west update

west zephyr-export
pip3 install --user -r ~/zephyrproject/zephyr/scripts/requirements.txt

#Install Zephyr SDK
cd ~
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.14.2/zephyr-sdk-0.14.2_linux-x86_64.tar.gz
wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.14.2/sha256.sum | shasum --check --ignore-missing

tar xvf zephyr-sdk-0.14.2_linux-x86_64.tar.gz
cd zephyr-sdk-0.14.2
./setup.sh

sudo cp ~/zephyr-sdk-0.14.2/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d
sudo udevadm control --reload

