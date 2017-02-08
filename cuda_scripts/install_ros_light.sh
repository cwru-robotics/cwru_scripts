#!/bin/bash
# Luc Bettaieb
# ROS Installation
# v 0.1


echo "Beginning ROS Installation"
echo "It is recommened that this step be completed after installing cuda but before building opencv"

echo -e "\e[1m \e[34m >>> Beginning ROS kinetic Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update

echo -e "\e[34m >>> Beginning ros-kinetic-base installation...\e[39m"
echo -e "\e[34m >>> No Lib opencv requirement\e[39m"

  sudo apt-get --yes --force-yes install ros-kinetic-ros-base

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

  source ~/.bashrc


sudo apt-get install 
  ros-kinetic-image-transport
  ros-kinetic-eigen-conversions
  ros-kinetic-tf
  ros-kinetic-tf2
  ros-kinetic-camera-calibration-parsers
  ros-kinetic-tf2-geometry-msgs
  ros-kinetic-driver-base
  ros-kinetic-camera-info-manager
  ros-kinetic-pcl-ros


echo -e "\e[34m >>> done installing! \e[39m"
echo -e "\e[34m >>> Note that opencv still needs to be built before installing the ros_ws! \e[39m"

#Add the requisite git requirements.
