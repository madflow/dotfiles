alias ls="lsd"
alias mkdir="mkdir -p"
alias kw="date +%V"
alias serve="python3 -m http.server 8000"
alias cat='bat'
alias quickbash='docker run -it --rm -v "$(pwd):/pwd" -w /pwd  bash bash'
alias quickubuntu='docker run -it --rm -v "$(pwd):/pwd" -w /pwd  ubuntu:focal bash'
alias quickphp='docker run -it --rm -v "$(pwd):/pwd" -w /pwd php:8.1-apache-bullseye bash'
alias quicknode='docker run -it --rm -v "$(pwd):/pwd" -w /pwd node:12-bullseye bash'
alias docker-stop-all='docker stop $(docker ps -aq)'
alias vim='nvim'
alias python='python3'
alias t='tmux'

alias kube-namespaces='kubectl get ns'
alias kube-pods='kubectl get pod --all-namespaces'
alias kube-latest-pods='kubectl get pods -A --sort-by=.metadata.creationTimestamp'

kube-pod-attach () {
    kubectl exec --stdin --tty `kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep ${1} | head -n 1` -- /bin/bash
}

function pushmr() {
    description=''
    if [ -n "$1" ]; then
    description="-o merge_request.description=$1"
    fi
    git push -o merge_request.title="$(git symbolic-ref --short HEAD)" -o merge_request.create ${description}
}
