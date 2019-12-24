#!/bin/bash

#Check root execution verification
if [[ "$EUID" -ne 0 ]]; then
	echo -e "Run this script as root"
	exit 1
fi

echo 'This script install Virtual 6.1 for Debian 10 users.'

#Add repository for install Virtualbox 6.1
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | tee -a /etc/apt/sources.list.d/virtualbox.list
#Move to /tmp for download GPG signed key
cd /tmp && wget https://www.virtualbox.org/download/oracle_vbox_2016.asc
#Install GPG signed key for VirtualBox repository
apt-key add oracle_vbox_2016.asc
#Update repositories and Virtualbox install
apt-get update && sudo apt-get install virtualbox-6.1 -y
