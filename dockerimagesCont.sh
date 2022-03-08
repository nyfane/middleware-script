#! /bin/bash
# Description: This script is to display your docker images and containers ID#####

#Author: Fanny G. 2022-03-07

if [ $UID -ne 0 ]

then
 
 echo -e "\n please run these commmands below \n"
 docker images 
 
 docker ps 

 else
 echo -e "\nThis user need to be add to the group docker\n"
 fi

 echo "Done!!!!"