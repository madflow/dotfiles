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