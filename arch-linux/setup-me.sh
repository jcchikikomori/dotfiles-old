#/bin/sh

# clear up screen
clear

echo "============================="
echo "  DOTFILES by jcchikikomori  "
echo "  Manjaro Edition            "
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

echo "Updating pacman mirrors ..."
sudo pacman-mirrors --fasttrack

echo "Updating your system ..."
sudo pacman -Syyu --noconfirm

echo "Setup yay & git ..."
sudo pacman -S yay git --noconfirm

echo "Installing required packages ..."
yay --noconfirm -S keychain glances byobu copyq awesome-terminal-fonts powerline2 powerline-fonts powerline-common nvm

echo "Install common web packages ..."
yay --noconfirm -S xsel composer mkcert rbenv rbenv-binstubs ruby-build

echo "Install oh-my-zsh & antigen ..."
yay --noconfirm -S oh-my-zsh-git antigen

echo "Byobu adjustments ..."
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
rm -f ~/.byobu/.tmux.conf
ln -sf ~/.tmux.conf ~/.byobu/.tmux.conf
ln -sf ~/.tmux.conf.local ~/.byobu/.tmux.conf.local

echo "Copy config ..."
cp -rf . ~/

clear

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

read -p "Setup done! Press any key to exit ..."

