#!/bin/bash

dir=~/dotfiles
linkdir=link

# Link all files in the link folder
echo "Linking files in link directory"
ln -s $dir/$linkdir/{*,.[^.]}* ~/
