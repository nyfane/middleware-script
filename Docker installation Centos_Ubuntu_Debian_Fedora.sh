#!/bin/bash
#Description: -----Script to install Docker on Centos7 Ubuntu Debian Fedora---------



#Author: Fanny G.  2022-03-09  email: jeuboufanny8@gmail.com

if cat /etc/*release | grep ^NAME | grep CentOS
then
echo -e"\n installation of docker in progress please be very patient!!!\n"
sleep 3

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

 sudo yum install docker-ce docker-ce-cli containerd.io

  sudo systemctl status docker
  sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker



elif cat /etc/*release | grep ^NAME | grep Ubuntu

# OS requirements

#Ubuntu Impish 21.10
#Ubuntu Hirsute 21.04
#Ubuntu Focal 20.04 (LTS)
#Ubuntu Bionic 18.04 (LTS)

then 


sudo apt-get remove docker docker-engine docker.io containerd runc

##Update the apt package index and install pakages to allow apt to use a repository over https###

sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    ## Add Docker's official GPG key

     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

###Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below.###

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io

 sudo systemctl start docker
sudo systemctl enable docker

sudo systemctl status docker 

 
  sudo docker run hello-world

  elif cat /etc/*release | grep ^NAME | grep Debian 

  #### OS requirements:
 ### Debian Bullseye 11 (stable)
#Debian Buster 10 (oldstable)
#Raspbian Bullseye 11 (stable)
#Raspbian Buster 10 (oldstable)
then 
##Uninstall old versions###

sudo apt-get remove docker docker-engine docker.io containerd runc

###Update the apt package index and install packages to allow apt to use a repository over HTTPS:##
 sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

    ##Add Docker's official GPG key ##

     curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

     ####Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below##

      echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  #### Install Docker Engine
   ####This procedure works for Debian on x86_64 / amd64, armhf, arm64, and Raspbian.

    sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io

 sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
####Verify that Docker Engine is installed correctly by running the hello-world image.

 sudo docker run hello-world

elif cat /etc/*release | grep ^NAME | grep Fedora

## OS requirements:

#Fedora 34
#Fedora 35

  then
  #Uninstall old versions##
   sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

                  sudo dnf -y install dnf-plugins-core
 sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

  ####Install Docker Engine##

   sudo dnf install docker-ce docker-ce-cli containerd.io

   sudo systemctl start docker
   sudo systemctl enable docker
sudo systemctl status docker

####Verify that Docker Engine is installed correctly by running the hello-world image.##
 sudo docker run hello-world

 else 
   echo "OS NOT DETECTED, couldn't install Docker "
    exit 1

 fi 

 echo "End"































