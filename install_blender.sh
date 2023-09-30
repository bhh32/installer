#!/bin/bash -e

pass=$1

if ! type "blender" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y blender
else
    echo "Blender is already installed!"
fi
