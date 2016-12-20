#!/bin/bash
# Script to automatically deploy the CLI utils on a new system.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating files from the templates..."
cp bash/bashrc.example _bashrc
cp vim/vimrc.example _vimrc

echo "Symlinking into home directory..."
ln -s $DIR/_bashrc $HOME/.bashrc
ln -s $DIR/_vimrc $HOME/.vimrc
ln -s $DIR/git/gitconfig $HOME/.gitconfig
ln -s $DIR/git/gitignore $HOME/.gitignore

echo "Setting up vim color scheme..."
mkdir -p $HOME/.vim/colors
wget https://raw.githubusercontent.com/twerth/ir_black/master/colors/ir_black.vim \
    -O $HOME/.vim/colors/ir_black.vim

echo "Sourcing ~/.bashrc..."
source $HOME/.bashrc

echo "Done."
