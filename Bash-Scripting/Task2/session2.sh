#!/bin/bash

#listing process information
ps aux > process.txt
echo "File process has created and includes the porcesses"

#Memory Usage
free -m  > memory.txt
echo "File memory has created and includes Memory Usage"

#Memory Usage
df -H  > disk.txt
echo "File disk has created and includes Disk Usage"

if [[ -f process.txt && -f memory.txt && -f disk.txt ]];

then
        echo " Commands are successful and files are created with Exit Code $?"
else
        echo "Error something worng Exit Code 1"

fi

tar -cvf output.tar process.txt memory.txt disk.txt /var/log/lastlog
echo "Files are compressed successfully"

#Copying the compressed output to another linux machine
read -p "Enter Auth. Username:" username
read -p "Enter Server IP:" ip
read -p "Path:" path

if scp ./Desktop/output.tar $username@$ip:$path ;
then
        echo "The output copied successfully"

else
        echo "Error file not copied "

fi
