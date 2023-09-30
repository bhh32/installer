#!/bin/bash -e

pass=$1

if ! type "xxd" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y xxd
else
    echo "xxd is already installed!"
fi