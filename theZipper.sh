#some code from Exequiel Barrirero at https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script, but modified by me to do a different role after indentifying OS type

#!/bin/bash
set -e

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
    echo "OS NOT DETECTED"
    exit 1;
 fi

zip -r zippedFiles /home


exit 0
