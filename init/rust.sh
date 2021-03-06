#!/bin/bash
if ! [ -x "$(command -v rustup)" ]; then
    echo "Installing rust"
    curl https://sh.rustup.rs -sSf | sh -s -- -y > /dev/null
else
    echo "Rust installation found"
fi

source $HOME/.cargo/env
echo "Updating rust"
rustup update stable > /dev/null
