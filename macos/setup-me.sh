#/bin/sh

HOMEBREW_NO_AUTO_UPDATE=1
USES_ZSH=false

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

echo "============================="
echo "  DOTFILES by jcchikikomori  "
echo "  MacOS Edition              "
echo "  Requires Mojave+           "
echo "============================="
echo ""
read -p "Press any key to continue ..."
echo ""

echo "Backup started ..."
rm -rf ~/.dotfiles-backup-old
mv ~/.dotfiles-backup ~/.dotfiles-backup-old
mkdir -p ~/.dotfiles-backup
cp -r ~/.ssh/ ~/.dotfiles-backup/.ssh
cp -r ~/.teamocil/ ~/.dotfiles-backup/.teamocil
cp -r ~/.tmux/ ~/.dotfiles-backup/.tmux
cp -r ~/.byobu/ ~/.dotfiles-backup/.byobu
cp ~/.tmux.conf ~/.dotfiles-backup/.tmux.conf
cp ~/.tmux.conf.local ~/.dotfiles-backup/.tmux.conf.local
cp ~/.bashrc ~/.dotfiles-backup/.bashrc
cp ~/.bash_profile ~/.dotfiles-backup/.bash_profile
cp ~/.zshrc ~/.dotfiles-backup/.zshrc
cp ~/.zsh_profile ~/.dotfiles-backup/.zsh_profile
cp ~/.profile ~/.dotfiles-backup/.profile
cp ~/.zsh_history ~/.dotfiles-backup/.zsh_history
cp ~/.zprofile ~/.dotfiles-backup/.zprofile
cp ~/.antigenrc ~/.dotfiles-backup/.antigenrc
cp ~/.p10k.zsh ~/.dotfiles-backup/.p10k.zsh
echo "Backup done ..."

read -p "Press any key to continue ..."

# clear again
clear

# homebrew update
# brew update

case $SHELL in
*/bash)
    # assume Bash
    echo "Installing zsh ..."
    brew install zsh
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
esac

# Continue with ZSH
if $USES_ZSH ; then
    echo "Initializing oh-my-zsh & antigen ..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -L git.io/antigen > $HOME/antigen.zsh
    echo "Installing shell packages ..."
    git clone https://github.com/powerline/fonts.git --depth=1
    sh fonts/install.sh
    rm -rf fonts
    # git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
    # sh nerd-fonts/install.sh
    # rm -rf nerd-fonts
    brew install glances byobu
    echo "Byobu adjustments ..."
    ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
    rm ~/.byobu/.tmux.conf
    ln -s ~/.tmux.conf ~/.byobu/.tmux.conf
    ln -s ~/.tmux.conf.local ~/.byobu/.tmux.conf.local
    echo "Install common web packages ..."
    brew install composer mkcert rbenv ruby-build nvm
    echo "Copy config ..."
    cp -rf .teamocil/ ~/
    cp -rf .tmux/ ~/
    cp -rf . ~/

    clear

    milk_me
    read -p "Setup done! Press any key to exit ..."
    exec $SHELL
fi

