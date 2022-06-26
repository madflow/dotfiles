# YARN
if (( $+commands[yarn] ))
then
  export PATH="`yarn global bin`:$PATH"
fi

# Local
export PATH="$HOME/.local/bin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH" 
