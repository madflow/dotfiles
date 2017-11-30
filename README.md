Oh my dot!

# Install

1. Clone this repo, flo, to ~/Projects/dotfiles

2. Install zsh, oh-my-zsh, tmux, tmuxinator, git whatever

3. Set up Vundle:

   `git clone https://github.com/VundleVim/Vundle.vim.git
   ~/.vim/bundle/Vundle.vim`

4. Set up links

   `ln -s ~/Projects/dotfiles/vimrc ~/.vimrc`

   `vim +PluginInstall +qall`

   `ln -s ~/Projects/dotfiles/zshrc ~/.zshrc`

   `ln -s ~/Projects/dotfiles/vim/colors ~/.vim/colors`

5. Git

   `git config --global alias.up 'pull --rebase --autostash'`

# Resources

* https://dotfiles.github.io/
