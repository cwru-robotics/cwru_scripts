#!/bin/bash
# Luc Bettaieb
# ARIAC Environment Setup Script

# add make run as sudo

sudo apt-get update && sudo apt-get upgrade --yes

sudo sh -c '
  echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" \
    > /etc/apt/sources.list.d/gazebo-stable.list'

wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get update

sudo sh -c '
  echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" \
    > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

sudo apt-get update

sudo apt-get install ros-indigo-desktop --yes

sudo rosdep init; rosdep update

sudo apt-get install ros-indigo-gazebo7-* ros-indigo-controller-manager ros-indigo-joint-trajectory-controller ros-indigo-effort-controllers ros-indigo-joint-state-controller --yes

# install gear packages from source.  there dont seem to be binaries yet?
mkdir -p ~/gear_ws/src
(cd ~/gear_ws/src && git clone https://bitbucket.org/osrf/gear)

source /opt/ros/indigo/setup.bash

(cd ~/gear_ws && catkin_make install)

source ~/gear_ws/install/setup.bash

echo 'source /opt/ros/indigo/setup.bash' << ~/.bashrc
echo 'source ~/gear_ws/install/setup.bash' << ~/.bashrc

source ~/.bashrc
