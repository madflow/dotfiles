#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
RUN_TIME=`date +"%Y-%m-%d-%H-%M-%S"`

function prompt_install() {
if ! [ -x "$(command -v ${1})" ]; then
    echo "${1} cannot be found. Install it with:" >&2
    if [ -x "$(command -v pacman)" ]; then
        echo "pacman -S ${1}" >&2
    fi
    if [ -x "$(command -v apt-get)" ]; then
        echo "apt-get install ${1}" >&2
    fi
    if [ -x "$(command -v brew)" ]; then
        echo "brew install ${1}" >&2
    fi
    exit 1
fi
}

prompt_install 'git'
prompt_install 'vim'
prompt_install 'tmux'

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
    echo "Vundle directory exists. Updating..."
    cd ~/.vim/bundle/Vundle.vim && git pull
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim/colors ~/.vim/colors
vim +PluginInstall +qall


# Tmux
if [ -d ~/.tmux/plugins/tpm ]
then
    echo "Tpm directory exists. Updating..."
    cd ~/.tmux/plugins/tpm && git pull
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
# Install and update TPM plugins
~/.tmux/plugins/tpm/bin/install_plugins
~/.tmux/plugins/tpm/bin/update_plugins all

# Git
touch ~/.gitconfig.local

if [ -L ~/.gitconfig ]
then
    echo "Git config does already exists as a symlink."
else
    if [ -f ~/.gitconfig ]
    then
        echo "Git config already exists. Backing up"
        mv ~/.gitconfig ~/.gitconfig.$RUN_TIME
    else
        echo "Git config does not already exist."
    fi
fi


# Symbolic links
ln -sf $SCRIPT_DIR/zshrc ~/.zshrc
ln -sf $SCRIPT_DIR/tmux.conf ~/.tmux.conf
ln -sf $SCRIPT_DIR/gitconfig ~/.gitconfig

