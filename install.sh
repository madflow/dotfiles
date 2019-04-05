#!/bin/bash

set -ex

# Clone the repo if needed
if [ -d ~/.dotfiles ]
then
    echo ".dotfiles exists"
else
    git clone git@github.com:madflow/dotfiles.git ~/.dotfiles
fi

# Vim

if [ -d ~/.vim/bundle/Vundle.vim ]
then
    echo "Vundle directory exists"
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim/colors ~/.vim/colors
vim +PluginInstall +qall


# Tmux
if [ -d ~/.tmux/plugins/tpm ]
then
    echo "Tpm directory exists"
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Symbolic links
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

