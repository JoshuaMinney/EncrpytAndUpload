#!/bin/bash
set -e


#checks to see which OS is in use, and installs zip accordingly
 if cat /etc/*release | grep ^NAME | grep CentOS; then
 sudo yum install zip

 elif cat /etc/*release | grep ^NAME | grep OpenSUSE; then
 sudo zypper install zip

 elif cat /etc/*release | grep ^NAME | grep Fedora; then
 sudo yum install zip

 elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
 sudo apt install zip

 elif cat /etc/*release | grep ^NAME | grep Debian ; then
 sudo apt install zip

 elif cat /etc/*release | grep ^NAME | grep Arch ; then
 sudo pacman -S zip

 elif cat /etc/*release | grep ^NAME | grep Manjaro; then
 sudo pacman -S zip

 else
    echo "This OS is not supported."
    exit 1;
 fi
#zips the home directory
zip -r zippedFiles /home


exit 0
