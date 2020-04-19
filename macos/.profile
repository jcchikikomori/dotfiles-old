# system installed libs
source /etc/profile

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
source /usr/share/nvm/init-nvm.sh
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
