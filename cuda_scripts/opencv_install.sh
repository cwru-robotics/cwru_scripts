# This file install the latest opencv script.


# install build essential etc.
echo "Beginning OpenCV 3.2.0 Installation"
echo "It is recommened that this step be completed after installing cuda and ROS"

mkdir -p ~/third_party_libs/opencv

cd ~/third_party_libs/opencv

wget https://github.com/opencv/opencv/archive/3.2.0.zip

sudo apt-get install -y unzip

unzip opencv-3.2.0.zip

sudo apt-get install -y libeigen3-dev
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y libqt4-dev libqt4-opengl-dev

cd opencv-3.2.0

mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. -D WITH_QT=ON -D WITH_OPENGL=ON

make

sudo make install

sudo ld_config





