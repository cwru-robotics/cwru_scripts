#!/bin/bash
# EECS 376/476 Mobile Robotics
# Workspace setup
# v 0.2

echo "Setting up workspace."

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
  mkdir -p ~/ros_ws/src/student_code

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

  cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/eecs_376_s16.git

  cd ~/ros_ws/src/cwru && git clone https://github.com/wsnewman/learning_ros_external_packages.git
  cd ~/ros_ws/src && git clone https://github.com/wsnewman/learning_ros.git

  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_msgs.git
  cd ~/ros_ws/src/cwru && git clone https://github.com/cwru-robotics/cwru_base.git

  cd ~/ros_ws && catkin_make
  cd ~/ros_ws && catkin_make install
  
  echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc
  echo "alias baxter_master='export ROS_MASTER_URI="http://baxter01:11311"'" >> ~/.bashrc
  echo "alias cs_create_pkg='~/ros_ws/src/cwru/learning_ros_external_packages/cs_create_pkg.py'" >> ~/.bashrc
  echo "export ROS_WORKSPACE=$HOME'/ros_ws'" >> ~/.bashrc
  echo "ROS_IP=`hostname -I | grep 172.[0-9]*.[0-9]*.[0-9]*`" >> ~/.bashrc
  echo "export ROS_IP=$ROS_IP" >> ~/.bashrc
  echo "jinx_master() { echo What is Jinxs IP address?; read JINX_IP; export ROS_MASTER_URI="http://$JINX_IP:11311";}" >> ~/.bashrc

  source ~/.bashrc
  
else
	echo "USAGE: ./setup_workspace_376 github_username github_email@email.com"

fi
