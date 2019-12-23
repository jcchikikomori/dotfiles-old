# composer auto-load
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
# qt5 specific
export QT_QPA_PLATFORMTHEME="qt5ct"
# default editor
export EDITOR=/usr/bin/nano
# gtk2 specific
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# linuxbrew. Can ignore
#eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
# Byobu linuxbrew
#export BYOBU_PREFIX=/home/linuxbrew/.linuxbrew

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# ruby-build
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# NVM
# LINUXBREW
#export NVM_DIR="$HOME/.nvm"
#  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# OTHER UNIX
source /usr/share/nvm/init-nvm.sh

# phpbrew
export PHPBREW_SET_PROMPT=1
export PHPBREW_RC_ENABLE=0
#source "/home/jccorsanes/.phpbrew/bashrc"

# Set build flags to homebrew
# For iOS webkit
# export PKG_CONFIG_PATH=$(brew --prefix)/opt/openssl/lib/pkgconfig
#export PKG_CONFIG_PATH=/lib/openssl-1.0/pkgconfig
# export libimobiledevice_CFLAGS=-I$(brew --prefix)/opt/libimobiledevice/include
# export libimobiledevice_LIBS=-L$(brew --prefix)/opt/libimobiledevice/lib

_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
