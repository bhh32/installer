#!/bin/bash -e

pass=$1

if ! type "vlc" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y vlc
else
    echo "VLC is already installed!"
fi