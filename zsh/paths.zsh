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
export PATH="$HOME/go/bin:$PATH"

# Ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Flutter
export PATH=$HOME/flutter/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config
