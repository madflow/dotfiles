# Heroku
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/opt/apache-maven/bin:$PATH"

# YARN
if (( $+commands[yarn] ))
then
  export PATH="`yarn global bin`:$PATH"
fi

# Local
export PATH="$HOME/.local/bin:$PATH"

# Composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Ruby
export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH" 
