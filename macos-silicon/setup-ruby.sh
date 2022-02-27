#/bin/sh

# This is required to disable homebrew updated while installing packages unattended.
# HOMEBREW_NO_AUTO_UPDATE=1

# For checking ZSH shell on your machine.
USES_ZSH=false
# For Android setup add-on.
ANDROID=false
OPENJDK_DIR="/Library/Java/JavaVirtualMachines/openjdk.jdk"
# For Generating SSH keys
GENERATE_SSH=false
# For restoring ZSH history
RESTOREZSHHISTORY=false

# Milk Me Reference: https://www.youtube.com/watch?v=qFfQJ2A9QhA
milk_me()
{
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMWX0OOKNWMMMMWKkkdoooxKWMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMM0;.  .'dXMWNO:.;loooloKMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMK:      ;l:,...,dkO00kxOXWMMMMMMMMMMMMM"
    echo "NWWWWWWWWWWWO,            ..';lkOxoxKNN0xoodONMMMM"
    echo "0Odoxk0Kxl:;,.           ......'cddkOkl.     ;0MMM"
    echo "NX00KXXX0kdc:;.         .....   .;oxOko..;c'.,0MMM"
    echo "NXXXXXXNXKxlc;.....'.   ....... .,dOOxc.;KWKkKWMMM"
    echo "NXXXKkolc,............  .........:OXKOl,dWMMMMMMMM"
    echo "XNXOc'...........................lKNNXkxXMMMMMMMMM"
    echo "XXk;..............'..............cKWNNXKXWMMMMMMMM"
    echo "X0l...............,'............'dNWWWWNKKWMMMMMMM"
    echo "Kx;..............'l;.       ....:KWWWWWWNKXWMMMMMM"
    echo "Ol............. .,OO,   .,,..  'xNWWWWWNKOk0XWMMMM"
    echo "o,.......        :OKx;.,dOO0x:,lKWWWWWKo;'',,oXMMM"
    echo "c.  ...          'dkkkdoddxO00kkOKWWNXOl,..  :XMMM"
    echo ".                .;c:lodk000OkkOOO0Oxdo:'.  'OMMMM"
    echo "                 .;lx00O0KKKOddxkkxdl:,'.';o0WMMMM"
    echo "                .lONMMMMMMMWXXNNNNNWWNXKKXNWMMMMMM"
    echo "               'xNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo ""
}

# clear up screen
clear

echo "=========================================="
echo "  DOTFILES by John Cyrill Corsanes        "
echo "  Apple Silicon Edition                   "
echo "  Requires MacOS Big Sur                  "
echo "=========================================="
echo ""
echo "Installing Ruby 2.5 automagically"
echo ""
read -p "Press any key to continue ..."
echo ""

# clear again
# clear

# homebrew update
echo "Checking Homebrew ..."
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing Homebrew ..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew detected! Updating ..."
    brew update
    echo "Checking Homebrew status ..."
    brew doctor
fi

case $SHELL in
*/bash)
    # assume Bash
    # Check if zsh already installed
    which -s zsh
    if [[ $? != 0 ]] ; then
        echo "Installing zsh ..."
        brew install zsh
    else
        echo "zsh already installed!"
    fi

    echo "Set zsh as default ..."
    chsh -s /bin/zsh
    
    milk_me
    echo "Please restart your terminal, if this still persists, you might restart your computer"
    echo "And run this setup again."
    read -p "Press any key to exit ..."
    exit
    ;;
*/zsh)
    # assume Zsh
    USES_ZSH=true
    echo "Replacing zsh ..."
    brew install zsh
esac

# Installation begin
if $USES_ZSH ; then
	echo "\n"
	echo "Uninstalling older rubies ..."
	brew uninstall ruby -f
    echo "Preparing ..."
    export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
	export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
	export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
	export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
	export optflags="-Wno-error=implicit-function-declaration"
	echo "Installing rbenv ..."
	brew install rbenv ruby-build
	echo "Installing ruby 2.5.3 ..."
	rbenv install 2.5.3
	rbenv global 2.5.3
	rbenv rehash
	echo "Installing ruby 2.5.9 ..."
	rbenv install 2.5.9
	rbenv rehash
	
	echo "Installing Database (required to install Ruby on Rails) ..."
	brew install postgresql mysql

	echo "Installing Rails 5.2.5 ..."
	export optflags="-Wno-error=implicit-function-declaration"
	export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
	export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
	export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
	gem install rails -v 5.2.5
	echo "Installing other gems ..."
	gem install rake ffi rubocop solargraph

    clear
    milk_me

    echo "\n"
    read -p "Setup done! Press any key to exit ..."
    exec $SHELL
fi

