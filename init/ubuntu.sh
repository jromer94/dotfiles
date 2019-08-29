#!/bin/bash

# Remove comments from sources.list to allow building source dependencies
echo "Enabling installing build dependencies"
sudo sed -i~orig -e 's/# deb-src/deb-src/' /etc/apt/sources.list

echo "Updating packages"
sudo apt-get -y update > /dev/null
