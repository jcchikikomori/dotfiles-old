eval "$(/opt/homebrew/bin/brew shellenv)"

# Python
# export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# OpenSSL over LibreSSL
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# https://medium.com/@3minus1/installing-old-ruby-versions-on-apple-m1-step-by-step-guide-501bb893c843
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.0/lib/pkgconfig"
export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
export optflags="-Wno-error=implicit-function-declaration"

# Ruby 2.5 Homebrew
export PATH="/opt/homebrew/opt/ruby@2.5/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/ruby@2.5/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/ruby@2.5/include"
#export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby@2.5/lib/pkgconfig"

# Installing 2.5.3 gems
export optflags="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# Docker
alias docker-compose="docker compose"

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

# Mame
# export PATH="/opt/mame:$PATH"

# Tmux
export DISABLE_AUTO_TITLE=true
