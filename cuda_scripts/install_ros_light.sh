#!/bin/bash
# Luc Bettaieb
# ROS Installation
# v 0.1


echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS Jade Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update

echo -e "\e[34m >>> Beginning ros-jade-base installation...\e[39m"
echo -e "\e[34m >>> No Lib opencv requirement\e[39m"

sudo apt-get --yes --force-yes install ros-jade-ros-base

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/jade/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

  source ~/.bashrc


sudo apt-get install ros-jade-image-transport ros-jade-eigen-conversions ros-jade-tf ros-jade-tf2 ros-jade-camera-calibration-parsers ros-jade-tf2-geometry-msgs ros-jade-driver-base ros-jade-camera-info-manager ros-jade-pcl-ros





echo -e "\e[34m >>> done! \e[39m"

#Add the requisite git requirements.
