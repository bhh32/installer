#!/bin/bash -e

# Takes in the sudo password from the script argument
pass=$1

# Check to see if virt-manager is already installed
if ! type "virt-manager" > /dev/null
then
    # Install virt-manager
    echo $pass | sudo -S apt update && sudo apt install -y virt-manager
    # Enable libvirtd so you can use virt-manager
    echo $pass | sudo -S systemctl enable --now libvirtd
else
    # virt-manager is already installed, tell the user
    echo "Virt Manager is already installed!"

    if [[ $(echo $pass | sudo -S systemctl status libvirtd | grep dead | cut -d'(' -f2 | cut -d')' -f1) == "dead" ]]
    then
        echo $pass | sudo -S systemctl enable --now libvirtd
    fi
fi
