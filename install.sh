#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
RUN_TIME=`date +"%Y-%m-%d-%H-%M-%S"`
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
OMYZSH="${HOME}/.oh-my-zsh"

function prompt_install() {

if ! [ -x "$(command -v ${1})" ]; then
    inst=${3-$1}
    echo "${1} cannot be found. Try installing it with:" >&2
    if [ -x "$(command -v pacman)" ]; then
        echo "pacman -S ${inst}" >&2
    fi
    if [ -x "$(command -v apt-get)" ]; then
        echo "apt-get install ${inst}" >&2
    fi
    if [ -x "$(command -v brew)" ]; then
        echo "brew install ${inst}" >&2
    fi
        if [ -x "$(command -v apk)" ]; then
        echo "apk add ${inst}" >&2
    fi
    if [ -z ${2+x} ]; then
       echo "No installation instructions provided" >&2
    else
        echo "Installation instructions can be found at: ${2}"  >&2
    fi
    exit 1
fi
}

prompt_install 'curl'
prompt_install 'git'
prompt_install 'tmux'
prompt_install 'vim'
prompt_install 'wget'
prompt_install 'zsh'

if [[ -d "$OMYZSH" ]]
then
    echo "oh my zsh seems to already installed."
else
    echo "Installing oh my zsh. Restart this script after oh my zsh is installed. Sleeping for 5 seconds..."
    sleep 5s
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Clone the repo if needed
if [ -d ~/.dotfiles ]
then
    echo ".dotfiles exists"
else
    git clone https://github.com/madflow/dotfiles.git ~/.dotfiles
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
ln -sf $SCRIPT_DIR/tmux.conf ~/.tmux.conf
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
        echo "Git config does not already exist. Creating it."
    fi
fi
ln -sf $SCRIPT_DIR/gitconfig ~/.gitconfig


# ZSH
ln -sf $SCRIPT_DIR/zshrc ~/.zshrc

# Local config
touch $SCRIPT_DIR/zsh/zlocal.zsh

