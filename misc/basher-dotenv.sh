#/bin/sh

# clear up screen
clear

echo "============================="
echo "  DOTFILES by jcchikikomori  "
echo "  Basher x Dotenv            "
echo "============================="
echo ""
read -p "Press any key to continue ..."
echo ""

# clear up screen
clear

echo "Installing basher ..."
echo ""
curl -s https://raw.githubusercontent.com/basherpm/basher/master/install.sh | bash
echo ""

echo "Installing dotenv CLI ..."
echo ""
basher install bashup/dotenv
echo ""
