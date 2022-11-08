alias ls="lsd"
alias mkdir="mkdir -p"
alias kw="date +%V"
alias serve="python3 -m http.server 8000"
alias cat='bat --paging=never --theme "Solarized (dark)" -p'
alias pushmr='git push -o merge_request.title="$(git symbolic-ref --short HEAD)" -o merge_request.create'
alias quickbash='docker run -it --rm -v "$(pwd):/pwd" -w /pwd  bash bash'
alias quickubuntu='docker run -it --rm -v "$(pwd):/pwd" -w /pwd  ubuntu:focal bash'
alias quickphp='docker run -it --rm -v "$(pwd):/pwd" -w /pwd php:8.1-apache-bullseye bash'
alias docker-stop-all='docker stop $(docker ps -aq)'
alias vim='lvim'
