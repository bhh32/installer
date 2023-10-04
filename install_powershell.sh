#!/bin/bash -e

pass=$1

if ! type "pwsh" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y wget apt-transport-https software-properties-common
    wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
    sudo apt install -y ./packages-microsoft-prod.deb
    rm -f packages-microsoft-prod.deb
    sudo apt update && sudo apt install -y powershell
else
    echo "PowerShell is already installed!"
fi