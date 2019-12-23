#!/bin/sh

echo 'This script install Virtual 6.1 for Debian 10 users.' 

#Add repository for install Virtualbox 6.1 
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
#Move to /tmp for download GPG signed key
cd /tmp && sudo wget https://www.virtualbox.org/download/oracle_vbox_2016.asc
#Install GPG signed key for VirtualBox repository
sudo apt-key add oracle_vbox_2016.asc
#Update repositories and Virtualbox install
sudo apt-get update && sudo apt-get install virtualbox-6.1 -y 
