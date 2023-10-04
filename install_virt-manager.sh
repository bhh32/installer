#!/bin/bash -e

pass=$1

if ! type "virt-manager" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y virt-manager
else
    echo "Virt Manager is already installed!"
fi