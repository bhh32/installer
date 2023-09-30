#!/bin/bash -e

pass=$1

# Install wget if not installed already
if ! type "wget" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y wget
fi

# Install gpg if not installed already
if ! type "gpg" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y gpg
fi

if ! type "code" > /dev/null
then
    # Download the gpg key
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

    # Install the gpg key for the repo
    echo $pass | sudo -S install -D -o root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

    # Install VSCode repo
    echo $pass | sudo -S sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

    # Remove the key package
    rm -f packages.microsoft.gpg

    # Update the packages and install the package
    sudo apt install -y apt-transport-https
    sudo apt update && sudo apt install -y code
else
    echo "VSCode is already installed!"
fi
