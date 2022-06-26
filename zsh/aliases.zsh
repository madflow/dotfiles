alias ls="ls --color"
alias kw="date +%V"
alias serve="python3 -m http.server 8000"
alias cat='bat --paging=never -p'
alias pushmr='git push -o merge_request.title="$(git symbolic-ref --short HEAD)" -o merge_request.create'
alias quickbash='docker run -it --rm  -v "$(pwd):/pwd" -w /pwd  bash bash'