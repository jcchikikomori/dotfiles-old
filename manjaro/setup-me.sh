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
sudo pacman-mirrors --fasttrack 8 && sudo pacman -Syyu

echo "Setup yay, git ..."
sudo pacman -S yay git

echo "Installing required packages ..."
yay -S glances byobu rbenv rbenv-binstubs copyq awesome-terminal-fonts powerline2 powerline-fonts powerline-common nvm
