#!/bin/bash
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
echo "Cloning alacritty"
git clone https://github.com/jwilm/alacritty.git ~/alacritty > /dev/null

cd ~/alacritty
git pull > /dev/null

echo "Building alacritty"
cargo install cargo-deb --force
echo "Installing alacritty deb file"
cargo deb --install --manifest-path alacritty/Cargo.toml
