# This file install the latest opencv script.


# install build essential etc.
sudo apt-get install -y build-essential



mkdir -p ~/third_party_libs/cmake

cd ~/third_party_libs/cmake

# get the cmake file:
wget https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz

#extract
tar -xvzf cmake-3.6.2.tar.gz

#install dependencies:

#one missing dependency might be g++2.0 
sudo apt-get -y checkinstall libcurl4-openssl-dev libarchive-dev qt4-dev-tools libglademm-2.4-dev
sudo apt-get -y glade-gtk2 

cd cmake-3.6.2

mkdir buld 
cd build 

cmake ..

make

sudo checkinstall

echo "Finished installing cmake!"

