# dotfiles
My personal dotfiles

# Table of content
1. [full installation](#full-installation)
2. [zsh installation](#zsh-installation)
3. [vim installation](#vim-installation)

## Full installation

I made a script to:

* install all the packages I need
* download zsh (+aliases), vim (+doc) config files
* change default terminal application and default shell
* ...

1. Download this script

`$ wget https://raw.githubusercontent.com/JeanS-github/dotfiles/main/first-install.sh`


2. Zsh installation

`wget -P ~ https://raw.githubusercontent.com/JeanS-github/dotfiles/main/.zshrc https://raw.githubusercontent.com/JeanS-github/dotfiles/main/.zshrc_aliases`

3. Vim installation

Installation of my `.vimrc` and plugins:

```sh
mkdir -p ~/.vim/bundle
wget -O ~/.vimrc https://raw.githubusercontent.com/JeanS-github/dotfiles/main/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

Installation of my personnal documentation:

```sh
mkdir -p ~/.vim/doc
wget -P ~/.vim/doc https://raw.githubusercontent.com/JeanS-github/dotfiles/main/doc/aide-0{01..15}.txt https://raw.githubusercontent.com/JeanS-github/dotfiles/main/doc/aide.txt
```
