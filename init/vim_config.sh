echo "Installing Plugins"
vim +PlugInstall +qall

echo "Compiling command t"
cd ~/.vim/plugged/command-t/ruby/command-t/ext/command-t
make clean > /dev/null
ruby extconf.rb > /dev/null
make > /dev/null

echo "Setting up swp, session, and undo folder directories"
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/undo
mkdir -p ~/.vim/tmp/view
mkdir -p ~/.vim/tmp/swap
touch ~/.vim/tmp/viminfo
