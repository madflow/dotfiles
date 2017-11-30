alias ls="ls --color"
alias kw="date +%V"
alias serve="python3 -m http.server 8000"
alias pip-upgrade-all="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias phpstan='docker run -v $PWD:/app --rm phpstan/phpstan'