#!/bin/bash
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
echo "Cloning alacritty"
git clone https://github.com/jwilm/alacritty.git ~/alacritty > /dev/null

cd ~/alacritty
git pull > /dev/null

echo "Building alacritty and installing"
cargo build --release

echo "Copying binary to bin"
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
