#!/bin/bash -e

pass=$1

if ! type "mozillavpn" > /dev/null
then
    echo $pass | sudo -S add-apt-repository ppa:mozillacorp/mozillavpn
    sudo apt update && sudo apt install -y resolvconf mozillavpn
else
    echo "Mozilla VPN has already been installed...\n"
fi