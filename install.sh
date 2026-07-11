#!/bin/sh

OS="$(uname)"

if [ "$OS" = "Darwin" ]; then
    echo "This is Mac \n"
    echo "Updating package lists and upgrading existing packages... \n"
    brew update
    brew upgrade
    echo "\nInstalling brew packages"
    brew bundle install --file $HOME/config/packages/Brewfile
elif [ "$OS" = "Linux" ]; then
    echo "This is Linux \n"
    echo "Updating package lists and upgrading existing packages..."
    sudo apt update
    sudo apt upgrade -y
    echo "\nInstalling apt repositories"
    xargs sudo apt install -y < packages/apt.txt
else
    echo "Unknown system: $OS"
fi

echo "\nDone."
