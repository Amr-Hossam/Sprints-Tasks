#!/bin/bash

echo " "
echo "This script will print variables, and execute Linux commands"
echo "  "

#Print env details, including current directory,current user, and list files in the home directory with the addition to the exit code for each command
#Use functions for each command including exit code
#Provide screenshots of the output

#Enter rest of code here

function current_directory(){
        echo "The current directory is:" $PWD
        echo "exit code $? "
}

function current_user(){
        echo "The current user is:" $USER
        echo "exit code $? "
}

function list_files(){
        echo "The files in home directory are: "
        ls  ~
        echo "exit code $? "
}
echo "Env details: "
current_directory
current_user
list_files
