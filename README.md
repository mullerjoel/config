# My configuration

In this repository is how i configure my computer. Feel free to clone it and make it your own.

## Installation

Clone the Repository and install the required packages. You can also delete or add packages in `packages/brew.txt`, `packages/cask.txt` or `packages/apt.txt`.

```bash
sh install.sh
```

> [!NOTE]
> If `zsh` is not your default shell (check with `echo $SHELL`), install it and set it as your default with `chsh -s "$(which zsh)"`.
> After changing your default shell, you may need to restart your computer for the change to take effect.

## Link the Dotfiles with stow

```bash
stow dotfiles
stow gitconfig
```
