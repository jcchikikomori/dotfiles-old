# system installed libs
source /etc/profile

# homebrew & colors
export PATH="/usr/local/sbin:$PATH"
export TERM=xterm-256color

# qt5 specific
export QT_QPA_PLATFORMTHEME="qt5ct"
# default editor
export EDITOR=/usr/bin/nano
# gtk2 specific
# export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# phpbrew
export PHPBREW_SET_PROMPT=1
export PHPBREW_RC_ENABLE=1

# composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ruby-build
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
