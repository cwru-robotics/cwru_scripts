#!/bin/bash
# EECS 376/476 Mobile Robotics
# Workspace setup
# Luc Bettaieb & Russell Jackson
# v 0.25

echo "Setting up workspace."

USERNAME=$1
EMAIL=$2

if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
then
  source ~/.bashrc
  echo -e "\e[34m >>> Sourced ~/.bashrc to obtain the ros distro path. \e[39m"

  mkdir -p ~/ros_ws/src
	
  cd ~/ros_ws/src  && catkin_init_workspace
  cd ~/ros_ws && catkin_make

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

  cd ~/ros_ws && catkin_make
  cd ~/ros_ws && catkin_make install
  
  echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc

  source ~/.bashrc
  
  rosdep update
  
else
	echo "USAGE: ./setup_ros_catkin_make_workspace.sh github_username github_email@email.com"

fi
