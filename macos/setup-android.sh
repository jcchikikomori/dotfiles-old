#/bin/sh

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

echo "==================================="
echo "  DOTFILES by jcchikikomori        "
echo "  MacOS Edition -- Android add-on  "
echo "  Requires Mojave+                 "
echo "==================================="
echo ""
read -p "Press any key to continue ..."
echo ""

echo "Installing Java ..."
brew cask install java

echo "Installing JDK required for SDK ..."
brew cask install homebrew/cask-versions/adoptopenjdk8

echo "Installing Android Dev packages including base SDK ..."
brew install ant maven gradle
brew cask install android-sdk
brew cask install android-ndk

echo "Updating Android SDK ..."
android update sdk --no-ui

echo "Init environment variables ..."
echo "\n" >> $HOME/.profile
echo "export ANT_HOME=\"/usr/local/opt/ant\"" >> $HOME/.profile
echo "export MAVEN_HOME=\"/usr/local/opt/maven\"" >> $HOME/.profile
echo "export GRADLE_HOME=\"/usr/local/opt/gradle\"" >> $HOME/.profile
echo "export ANDROID_HOME=\"/usr/local/opt/android-sdk\"" >> $HOME/.profile
echo "export ANDROID_SDK_ROOT=\"/usr/local/share/android-sdk\"" >> $HOME/.profile
echo "export ANDROID_NDK_HOME=\"/usr/local/opt/android-ndk\"\n" >> $HOME/.profile

clear

milk_me
read -p "Setup done! Press any key to exit ..."
source $HOME/.profile
