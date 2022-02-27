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
echo "We need to backup the existing files first..."
echo "WARNING: Will delete the older backup files!"
echo ""
read -p "Press any key to continue ..."
echo ""

while true; do
    read -p "Do you want to generate new SSH keys? (y/N): " sshyn
    case $sshyn in
        [Yy]* ) GENERATE_SSH=true; break;;
        [Nn]* ) GENERATE_SSH=false; break;;
        * ) GENERATE_SSH=false; break;;
    esac
done

echo ""
echo "Backup started ..."
rm -rf ~/.dotfiles-backup-old
mv ~/.dotfiles-backup ~/.dotfiles-backup-old
mkdir -p ~/.dotfiles-backup
cp -r ~/.ssh/ ~/.dotfiles-backup/.ssh 2>/dev/null || :
cp -r ~/.teamocil/ ~/.dotfiles-backup/.teamocil 2>/dev/null || :
cp -r ~/.tmux/ ~/.dotfiles-backup/.tmux 2>/dev/null || :
cp -r ~/.byobu/ ~/.dotfiles-backup/.byobu 2>/dev/null || :
cp ~/.tmux.conf ~/.dotfiles-backup/.tmux.conf 2>/dev/null || :
cp ~/.tmux.conf.local ~/.dotfiles-backup/.tmux.conf.local 2>/dev/null || :
cp ~/.bashrc ~/.dotfiles-backup/.bashrc 2>/dev/null || :
cp ~/.bash_profile ~/.dotfiles-backup/.bash_profile 2>/dev/null || :
cp ~/.zshrc ~/.dotfiles-backup/.zshrc 2>/dev/null || :
cp ~/.zsh_profile ~/.dotfiles-backup/.zsh_profile 2>/dev/null || :
cp ~/.profile ~/.dotfiles-backup/.profile 2>/dev/null || :
cp ~/.zsh_history ~/.dotfiles-backup/.zsh_history 2>/dev/null || :
cp ~/.zprofile ~/.dotfiles-backup/.zprofile 2>/dev/null || :
cp ~/.antigenrc ~/.dotfiles-backup/.antigenrc 2>/dev/null || :
cp ~/.p10k.zsh ~/.dotfiles-backup/.p10k.zsh 2>/dev/null || :
echo "Backup done ..."

read -p "Press any key to continue ..."

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
    echo "Installing antigen ..."
    brew install antigen
    echo "Installing shell packages ..."
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    brew install glances gotop htop byobu
    echo "Installing openssl 1.1 ..."
    brew install openssl@1.1
    echo "Installing libffi ..."
    brew install libffi
    echo "Installing common web packages ..."
    brew install composer mkcert rbenv ruby-build nvm
    echo "Installing tmux ..."
    brew install tmuxp

    if $GENERATE_SSH ; then
        echo "Generating SSH keys ..."
        ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
    fi

    if $ANDROID ; then
	    # Not needed anymore. I prefer to install Android Studio
        echo "Android setup done!"
    fi

    clear
    milk_me

    echo "\n"
    read -p "Setup done! Press any key to exit ..."
    exec $SHELL
fi

