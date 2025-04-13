#!/bin/bash -e

pass=$1

if ! type "zenity" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y zenity
else
    echo "Zenity is already installed!"
fi