#!/bin/bash

# Remove comments from sources.list to allow building source dependencies
echo "Enabling installing build dependencies"
sudo sed -i~orig -e 's/# deb-src/deb-src/' /etc/apt/sources.list

echo "Updating packages"
sudo apt-get -y update > /dev/null

echo "Installing basic dependencies i.e git, curl"
sudo apt-get -y install git curl > /dev/null

echo "setting gnome to use two finger right click"
gsettings set org.gnome.desktop.peripherals.touchpad click-method fingers

echo "setting gnome to map caps lock to escape"
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
