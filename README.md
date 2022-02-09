# dotfiles
My personal dotfiles

# Table of content
* [full installation](#full-installation)
* [zsh installation](#zsh-installation)
* [vim installation](#vim-installation)

## Full installation

I made a script to:

* install all the packages I need (zsh, terminator, vim (+gtk3), aptitude, git, curl, tldr)
* download zsh (+ aliases, + plugins), vim (+ doc) config files
* change default terminal application and default shell
* ...

Download and execute this script

(you'll ask for sudo permission)

```sh
$ wget https://raw.githubusercontent.com/JeanS-github/dotfiles/main/first-install.sh
$ chmod +x first-install.sh
$ ./first-install.sh
```


# Zsh installation

`wget -P ~ https://raw.githubusercontent.com/JeanS-github/dofiles/main/.zshrc https://raw.githubusercontent.com/JeanS-github/dotfiles/main/.zshrc_aliases`

# Vim installation

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

