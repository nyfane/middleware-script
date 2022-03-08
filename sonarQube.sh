#!/bin/bash
#Description: Installation of Sonarqube on CentOS7
#Author: Fanny G.  2022-02-24

echo "Sonarqube installation on Centos 7 in progress ..."
sleep 3
sudo yum update -y
sudo yum install java-11-openjdk-devel java-11-openjdk wget unzip net-tools -y
cd /opt 
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
echo
echo "Installation was successful !"
echo "system starting Sonarqube now..."
sleep 1
echo "System in the process of retrieving current ip address..."
sleep 2
echo "Below is your IP Address : " 
sudo ifconfig | grep 192.

echo " "

echo "please use this link to connect to the SonarQube server through the browser. http://$(ifconfig eth1|head -2|tail -1|awk '{print $2}'):9000"

echo " "
sleep 3
echo "Please use this to login into the server. Login: admin  Password: admin"

echo " "
sleep 3

echo "Please update your password and access the dashboard. Old Password: admin  New Password: school1"
echo " "
sleep 3 
echo "press enter to be redirected to the SonarQube home screen"


#NB: Some servers have firewall enabled. So if you are not able to connect 
#from the browser, then you might want to open the port 9000 with this command:

#Delete the pound sign at the beginning of both commmand below
#Proceed by running the program again
 
#sudo firewall-cmd --permanent --add-port=9000/tcp
#sudo firewall-cmd --reload
       echo "End"