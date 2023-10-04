#!/bin/bash -e

pass=$1

if ! type "steam" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y steam
else
    echo "Steam is already installed!"
fi