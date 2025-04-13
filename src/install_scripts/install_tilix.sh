#!/bin/bash -e

pass=$1

if ! type "tilix" > /dev/null
then
    echo $pass | sudo -S apt update && sudo apt install -y tilix
else
    echo "Tilix is already installed!"
fi