#!/bin/bash -e

pass=$1

if ! type "krita" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y krita
else
    echo "Krita is already installed!"
fi