# This file install the latest opencv script.


# install build essential etc.

mkdir -p ~/third_party_libs/opencv

cd ~/third_party_libs/opencv

wget https://github.com/Itseez/opencv/archive/3.1.0.zip

sudo apt-get install -y unzip

unzip opencv-3.1.0.zip

sudo apt-get install -y pkgconfig libeigen3-dev
sudo apt-get install -y python-dev python-numpy
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev

cd opencv-3.1.0

mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

make

sudo make install

sudo ld_config





