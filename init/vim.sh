#!/bin/bash

# TODO make this work for mac
echo "Installing vim dependencies"
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git > /dev/null

echo "Cloning vim"
git clone https://github.com/vim/vim.git ~/vim > /dev/null

cd ~/vim > /dev/null
git pull > /dev/null

echo "Configuring"
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp > /dev/null
echo "Making"
make > /dev/null
echo "Installing"
sudo make install > /dev/null
echo "Making clean"
make clean > /dev/null
echo "Making dist clean"
make distclean > /dev/null

echo "Cloning Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null
