# Commands when installing a new operating system

# my packages
sudo apt update
sudo apt install -y zsh terminator vim vim-gtk3 aptitude git curl tldr
# for LateX
# sudo apt install -y vim-latexsuite
# if no latex menu in gvim: in terminal:
# $ vim-addons install latex-suite

# Download all config files

# get zshrc and aliases
wget -P ~ https://raw.githubusercontent.com/JeanS-github/dotfiles/master/.zshrc https://raw.githubusercontent.com/JeanS-github/dotfiles/master/.zsh_aliases

# Download the 3 best zsh plugins
sudo mkdir -p /opt/zsh-plugins/{zsh-syntax-highlighting,zsh-completions,zsh-autosuggestions}
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /opt/zsh-plugins/zsh-syntax-highlighting/
sudo git clone https://github.com/zsh-users/zsh-completions.git /opt/zsh-plugins/zsh-completions/
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /opt/zsh-plugins/zsh-autosuggestions/

##echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" >> ${ZDOTDIR:-$HOME}/.zshrc 
##echo "source /opt/zsh-plugins/zsh-completions/zsh-completions.zsh 2>/dev/null" >> ~/.zshrc
##echo "source /opt/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" >> ~/.zshrc

# rm -f ~/.zcompdump; compinit

# vim plugins and doc
mkdir -p ~/.vim/bundle
wget -O ~/.vimrc https://raw.githubusercontent.com/JeanS-github/dotfiles/master/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir -p ~/.vim/doc
wget -P ~/.vim/doc https://raw.githubusercontent.com/JeanS-github/dotfiles/master/doc/aide-0{01..15}.txt https://raw.githubusercontent.com/JeanS-github/dotfiles/master/.vimrc
echo -e "\nTo install doc, run vim and type:\n:helptags ~/.vim/doc\n"

# bin files
# **comming soon** in github.../dotfiles/

## mkdir ~/bin/
## wget -O ~/bin/ https://raw.githubusercontent.com/JeanS-github/dotfiles/master/bin/*
## OR git clone the entire repository

# function for manually change shell in /etc/passwd file with sed, if chsh doesn't work
sed_fun_change () {
   sudo sed -i 's#/bin/bash#'$(which zsh)'#' /etc/passwd
}

# changing default shell
sudo chsh -s /usr/bin/zsh
# test if zsh is the new default shell,
# if not change directly the /etc/passwd file
if grep -q "/usr/bin/zsh" /etc/passwd; then echo "file already changed"; else "No zsh in this file, need to change..."; fi
read -p "Do you want to manually change the passwd file? [y/n]: " ANSWER
case $ANSWER in
    [y]* ) sed_fun_change; echo "you need to disconnect and reconnect";;
    [n]* ) echo "ok, no changes, exit."; exit;;
    * ) echo "Answer is y or n.";;
esac

# applying my terminator config
wget -O ~/.config/terminator/config https://raw.githubusercontent.com/JeanS-github/dotfiles/master/terminator-config

# change the default terminal application by terminator
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"

# apply all changes
exec $SHELL

