#!/bin/bash
# cwru davinci research kit Setup Script
# Luc Bettaieb 2015
# Russell Jackson 2016
# v 0.2

echo "Setting up workspace for the daVinci research kit."
echo "This installation assumes that ros-indigo is pre-installed."

USERNAME=$1
EMAIL=$2

if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
then
  source /opt/ros/indigo/setup.bash
  echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	
  mkdir -p ~/ros_ws/src
	
  cd ~/ros_ws/src  && catkin_init_workspace
  cd ~/ros_ws && catkin_make

  mkdir -p ~/ros_ws/src/cwru
  mkdir -p ~/ros_ws/src/external

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_msgs.git
  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_base.git

  cd ~/ros_ws && catkin_make
  cd ~/ros_ws && catkin_make install

  echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc
  
  source ~/.bashrc
  
  # Here, the davinci specific libraries are loaded from git hub.

  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_davinci.git
  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_vision.git
  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_suture_needles.git
 

  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_msgs.git
  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_base.git

  cd ~/ros_ws && catkin_make
  

  
else
	echo "USAGE: ./initialize_workspace.sh github_username github_email@email.com"

fi
