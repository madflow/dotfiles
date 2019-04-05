Oh my dot!

# Install

1. Clone this repo, flo, to ~/.dotfiles

2. Install zsh, oh-my-zsh, tmux, tmuxinator, git whatever

3. Set up Vundle:

   `git clone https://github.com/VundleVim/Vundle.vim.git
   ~/.vim/bundle/Vundle.vim`

   `ln -s ~/.dotfiles/vimrc ~/.vimrc`

   `vim +PluginInstall +qall`

4. Setup Tmux

   `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` 
   Press ```prefix + I``` (capital I, as in Install) to fetch the plugin.

5. Set up links

   `ln -s ~/.dotfiles/zshrc ~/.zshrc`

   `ln -s ~/.dotfiles/vim/colors ~/.vim/colors`

   `ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf`

6. Git

   `git config --global alias.up 'pull --rebase --autostash'`

# Resources

* https://dotfiles.github.io/
