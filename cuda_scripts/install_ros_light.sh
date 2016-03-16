#!/bin/bash
# Luc Bettaieb
# ROS Installation
# v 0.1



echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

  source ~/.bashrc

echo -e "\e[34m >>> done! \e[39m"



sudo apt-get install ros-jade-image-transport ros-jade-eigen-conversions ros-jade-tf ros-jade-tf2 ros-jade-camera-calibration-parsers ros-jade-tf2-geometry-msgs ros-jade-driver-base ros-jade-camera-info-manager ros-jade-pcl-ros

#Add the requisite git requirements.
