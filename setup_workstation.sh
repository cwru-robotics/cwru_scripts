#!/bin/bash
# Mobile Robotics Lab Workstation Setup Script
# Luc Bettaieb 2015

echo "Starting workstation setup..."

# Make sure only root can run our script
# if [[ $EUID -ne 0 ]]; then
#    echo -e "\e[31mThis script must be run as root.\e[0m" 1>&2
#    exit 1
# fi
# ...

echo -e "\e[1m \e[34m >>> Beginning ROS Indigo Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

echo -e "\e[34m >>> ...done\e[39m"

	sudo apt-get update

echo -e "\e[34m >>> Beginning ros-indigo-desktop-full installation...\e[39m"

	sudo apt-get install ros-indigo-desktop-full --yes

echo -e "\e[34m >>> Setting up rosdep\e[39m"

	# sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
	sudo rosdep init
	rosdep update
	# sudo rosdep fix-permissions

echo -e "\e[34m >>> Setting up environment \e[39m"

	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

	sudo apt-get install python-rosinstall

# This should probably be in a separate script or I should have the user not run the scipt as root

echo -e "\e[34m >>> Starting workspace setup \e[39m"

	mkdir -p ~/ros_ws/src

	(cd ~/ros_ws/src && catkin_init_workspace)

	(cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/cwru_baxter.git)

	(cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/external_packages.git)

	(cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/eecs-397-f15.git)

	mkdir ~/ros_ws/src/rethink

	(cd ~/ros_ws/src/rethink && git clone https://github.com/RethinkRobotics/baxter_interface.git)
	(cd ~/ros_ws/src/rethink && git clone https://github.com/RethinkRobotics/baxter_common.git)
	(cd ~/ros_ws/src/rethink && git clone https://github.com/RethinkRobotics/baxter_tools.git)
	
	echo -e "\e[31mSTILL NEED TO MANUALL INSTALL BAXTER_SIMULATOR\e[0m"

	sudo apt-get install ros-indigo-controller-interface ros-indigo-gazebo-ros-control ros-indigo-joint-state-controller ros-indigo-effort-controllers ros-indigo-moveit-msgs

	(cd ~/ros_ws && catkin_make clean)
	(cd ~/ros_ws && catkin_make --pkg cwru_srv)
	
	(cd ~/ros_ws && catkin_make --pkg baxter_core_msgs)
	(cd ~/ros_ws && catkin_make --pkg baxter_traj_streamer)
	(cd ~/ros_ws && catkin_make)
	(cd ~/ros_ws && catkin_make install)