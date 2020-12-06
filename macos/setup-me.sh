#/bin/sh

# This is required to disable homebrew updated while installing packages unattended.
HOMEBREW_NO_AUTO_UPDATE=1
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
echo "  MacOS Edition                           "
echo "  Requires 10.14 and up & ITerm2 (latest) "
echo "=========================================="
echo ""
echo "We need to backup the existing files first..."
echo "WARNING: Will delete the older backup files!"
echo ""
read -p "Press any key to continue ..."
echo ""

while true; do
    echo "NOTE: Android setup requires sudo"
    echo ""
    read -p "Do you want to install the Android setup add-on? (y/N): " androidyn
    case $androidyn in
        [Yy]* ) ANDROID=true; break;;
        [Nn]* ) ANDROID=false; break;;
        * ) ANDROID=false; break;;
    esac
done

while true; do
    read -p "Do you want to generate new SSH keys? (y/N): " sshyn
    case $sshyn in
        [Yy]* ) GENERATE_SSH=true; break;;
        [Nn]* ) GENERATE_SSH=false; break;;
        * ) GENERATE_SSH=false; break;;
    esac
done

while true; do
    read -p "Do you want to restore your ZSH history? (y/N): " zshhistoryyn
    case $zshhistoryyn in
        [Yy]* ) RESTOREZSHHISTORY=true; break;;
        [Nn]* ) RESTOREZSHHISTORY=false; break;;
        * ) RESTOREZSHHISTORY=false; break;;
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

# restore ZSH history
if $RESTOREZSHHISTORY ; then
    cp -f ~/.dotfiles-backup/.zsh_history ~/ 2>/dev/null || :
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

# Continue with ZSH
if $USES_ZSH ; then
    echo "Initializing oh-my-zsh & antigen ..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -L git.io/antigen > $HOME/antigen.zsh
    echo "Installing shell packages ..."
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    brew install glances gotop byobu
    echo "Install common web packages ..."
    brew install composer mkcert rbenv ruby-build nvm

    if $GENERATE_SSH ; then
        echo "Generating SSH keys ..."
        ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
    fi

    echo "Copy config ..."
    cp -rf .teamocil/ ~/
    # cp -rf .tmux/ ~/
    cp -rf . ~/
    rm -f ~/.ssh/config
    rm -rf ~/.tmux/
    echo "Applying TMUX theme ..."
    git clone https://github.com/gpakosz/.tmux.git ~/.tmux
    echo "Applying TMUX theme to byobu ..."
    ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf 2>/dev/null || :
    rm -f ~/.byobu/.tmux.conf
    rm -f ~/.byobu/.tmux.conf.local
    ln -s -f ~/.tmux/.tmux.conf ~/.byobu/.tmux.conf 2>/dev/null || :
    ln -s -f ~/.tmux/.tmux.conf.local ~/.byobu/.tmux.conf.local 2>/dev/null || :

    if $ANDROID ; then
        echo "Installing OpenJDK (Java 8) ..."
        brew tap adoptopenjdk/openjdk
        brew install --cask adoptopenjdk/openjdk/adoptopenjdk8
        if [ -d "$OPENJDK_DIR" ]; then
            echo "CONFLICT: Skipping Symlinking OpenJDK (Already exists)!"
        else 
            echo "Symlinking OpenJDK (requires sudo) to ${OPENJDK_DIR}..."
            sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk $OPENJDK_DIR
        fi
        echo "Installing Gradle ..."
        brew install gradle
        echo "Installing Android SDK ..."
        brew install --cask android-sdk
        echo "Installing Android optionals ..."
        brew install ant
        brew install maven
        brew install --cask android-ndk
        echo "Downloading required sources ..."
        mkdir -p ~/.android
        echo "Downloading Build tools 28 ..."
        touch ~/.android/repositories.cfg
        yes | sdkmanager --licenses
        sdkmanager "platform-tools" "platforms;android-28"
        sdkmanager --no_https --install 'build-tools;28'
        sdkmanager --no_https --install emulator
        sdkmanager --list
        echo "Downloading Build tools 29 ..."
        touch ~/.android/repositories.cfg
        yes | sdkmanager --licenses
        sdkmanager --update
        sdkmanager --no_https --install emulator
        sdkmanager --no_https --install platform-tools
        sdkmanager --no_https --install 'system-images;android-29;google_apis_playstore;x86_64'
        sdkmanager --no_https --install 'extras;intel;Hardware_Accelerated_Execution_Manager'
        sdkmanager --no_https --install 'build-tools;29.0.2'
        sdkmanager --no_https --install 'platforms;android-29'
        sdkmanager --list
        echo "Downloading Build tools 23 ..."
        touch ~/.android/repositories.cfg
        sdkmanager "platform-tools" "platforms;android-23"
        sdkmanager "build-tools;23.0.1"
        echo "Installing Intel HAXM ..."
        brew install --cask intel-haxm

        echo "Android setup done!"
    fi

    clear
    milk_me
    # echo "Please execute `p10k configure` on your iTerm terminal"
    if $ANDROID; then
        echo "For Android: Environment variables are already defined on .profile."
    else
        echo "You can manually setup the Android later.\nFollow the guide with this link: https://gist.github.com/jcchikikomori/fe1a14bbbe9c90a87d96248c2e5329a7"
    fi
    echo "\n"
    read -p "Setup done! Press any key to exit ..."
    exec $SHELL
fi

