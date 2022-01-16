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
export PATH="$HOME/.composer/vendor/bin:$PATH"

# prefer homebrew-based openssl
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ruby-build
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
_byobu_sourced=1 . /usr/local/Cellar/byobu/5.133/bin/byobu-launch 2>/dev/null || true

# Java & Android
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export INTEL_HAXM_HOME="/usr/local/Caskroom/intel-haxm"
export ANT_HOME="/usr/local/opt/ant"
export MAVEN_HOME="/usr/local/opt/maven"
export GRADLE_HOME="/usr/local/opt/gradle"
export ANDROID_HOME="/usr/local/Caskroom/android-sdk/4333796"
export ANDROID_SDK_ROOT="/usr/local/Caskroom/android-sdk/4333796"
export ANDROID_NDK_HOME="/usr/local/Caskroom/android-ndk/"

