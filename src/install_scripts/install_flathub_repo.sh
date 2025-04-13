#!/bin/bash -e

# Get the password from the python script
passwd=$1

# Check to see if flatpak is installed
if ! type "flatpak" > /dev/null
then
    # If it isn't, install it
    echo $pass | sudo -S apt update && sudo apt install -y flatpak
    
    # If it wasn't installed and this is GNOME DE, install it in the gnome software store
    if [[ $(echo $XDG_CURRENT_DESKTOP | grep -i gnome) ]]
    then
        sudo apt install -y gnome-software-plugin-flatpak
    fi
fi

# Attempt to add the flathub repository to flatpak if it doesn't already exist.
echo $passwd | sudo -S flatpak remote-add --if-not-exists flathub http://dl.flathub.org/repo/flathub.flatpakrepo

