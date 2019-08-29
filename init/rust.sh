#!/bin/bash
echo "Installing rust"
curl https://sh.rustup.rs -sSf | sh

echo "Updating rust"
rustup update stable
