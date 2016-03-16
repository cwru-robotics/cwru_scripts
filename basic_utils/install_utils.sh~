#!/bin/bash
# utilities for ROS installation.
# This file is meant to set up the utilities that all installations need.
# v 0.1

echo "Beginning utility installation:"

sudo apt-get --yes --force-yes install build-essential cifs-utils netbeans gitk kazam cmake git pkg-config libncurses-dev qt4-qmake libarchive-dev qt4-dev-tools gtk2-engines glade libgtkmm-3.0-dev libgtkmm-2.4-dev libglademm-2.4-dev libcurl4-openssl-dev checkinstall
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get --yes --force-yes install sublime-text-installer 

mkdir ~/third_party_libs

cd ~/third_party_libs 
wget https://cmake.org/files/v3.5/cmake-3.5.0.tar.gz
tar xvfz cmake-3.5.0.tar.gz
cd cmake-3.5.0
mkdir build
cd build
cmake .. -DCMAKE_USE_OPENSSL
make
sudo checkinstall
cd ../..

echo "Finished the utilities"


