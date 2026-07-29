#!/bin/bash

OS="$(uname)"

if [ "$OS" = "Darwin" ]; then
    printf "This is Mac\n\n"
    printf "Updating package lists and upgrading existing packages...\n\n"
    brew update
    brew upgrade
    printf "\nInstalling brew packages\n"
    brew bundle install --file "$HOME/config/packages/Brewfile"
    brew bundle cleanup --file "$HOME/config/packages/Brewfile"
elif [ "$OS" = "Linux" ]; then
    printf "This is Linux\n\n"
    printf "Updating package lists and upgrading existing packages...\n"
    sudo apt update
    sudo apt upgrade -y
    printf "\nInstalling apt repositories\n"
    xargs sudo apt install -y < packages/apt.txt
else
    printf "Unknown system: %s\n" "$OS"
fi

printf "\nLinking Dotfiles\n"

stow -v -d "$HOME/config" -t "$HOME" dotfiles
stow -v -d "$HOME/config" -t "$HOME" gitconfig

printf "\nDone.\n"
