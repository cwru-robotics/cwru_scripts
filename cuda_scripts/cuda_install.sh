

# This File is depreciated.
# New commands to run are:
# 1. remove the nov
nano /etc/modprobe.d/blacklist-nouveau.conf
…and add these lines at the end:
sudo apt-get purge xserver-xorg-video-nouveau
sudo lightdm stop
blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off

lshw -c video | 'configuration'
#Some how autodownload the dpkg file.
cd third_party_libs
mkdir cuda
cd cuda
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb 
sudo apt-get update
sudo apt-get install cuda

echo "export PATH=/usr/local/cuda-7.5/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc

source ~/.bashrc

echo  "installing examples"

sudo Ldconfig

./cuda-install-samples-7.5.sh ~

cd NVIDIA_CUDA-7.5_Samples/1_Utilities/deviceQuery
make
cd ../../bin/x86_64/linux/release/

#this won't work
echo "Please restart this machine"

sudo shutdown now -r

./deviceQuery



