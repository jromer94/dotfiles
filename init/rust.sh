#!/bin/bash
if ! [ -x "$(command -v rustup)" ]; then
    echo "Installing rust"
    curl https://sh.rustup.rs -sSf | sh -y > /dev/null
else
    echo "Rust installation found"
fi

echo "Updating rust"
rustup update stable > /dev/null
