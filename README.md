> Oh my dot!

# .dotfiles

## Installation

1. Clone this repo, flo, to ~/.dotfiles

2. Install 

```
bat curl git go httpie mcfly nvm openssh-client tmux vim wget zsh
```

3. `./install.sh`

prompt_install 'bat'
prompt_install 'curl'
prompt_install 'git'
prompt_install 'go' 'https://go.dev/dl/'
prompt_install 'http' 'https://httpie.io/docs/cli/installation' 'httpie'
prompt_install 'mcfly'
#prompt_install 'nvm' 'https://github.com/nvm-sh/nvm'
prompt_install 'ssh' 'https://www.ssh.com/ssh/' 'openssh-client'
prompt_install 'tmux'
prompt_install 'vim'
prompt_install 'wget'
prompt_install 'zsh'

or try ...

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/madflow/dotfiles/master/install.sh)"
```

## Resources

* https://dotfiles.github.io/
* https://github.com/thoughtbot/dotfiles
