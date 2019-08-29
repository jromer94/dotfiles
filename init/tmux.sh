#!/bin/bash

# TODO make this work for mac
echo "Installing tmux dependencies"
sudo apt install -y automake
sudo apt install -y bison
sudo apt install -y build-essential
sudo apt install -y pkg-config
sudo apt install -y libevent-dev
sudo apt install -y libncurses5-dev

echo "Cloning tmux"
git clone https://github.com/tmux/tmux.git ~/tmux > /dev/null

cd ~/tmux > /dev/null
git pull > /dev/null

echo "Building tmux"
sh autogen.sh > /dev/null
./configure && make > /dev/null
sudo make install > /dev/null

echo "Cloning tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null
echo "Installing tmux plugins"
sh ~/.tmux/plugins/tpm/scripts/install_plugins.sh > /dev/null
