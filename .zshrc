setopt PROMPT_SUBST
PROMPT=$'%{$fg_bold[green]%}%n %{$reset_color%}%{$fg_bold[blue]%}$(showone)%{$reset_color%}%{$fg[blue]%} $%{$fg_bold[blue]%}%{$reset_color%} '

function showone() {
    echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~} | sed -e 's/^\/h\/'$(id -un)'/~/' | sed -e 's#^//#/#'
}

# ====== Github ======
autoload vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
# Format the vcs_info_msg_0_ variable
# \ue0a0 = branch icon
# to be able to see git branch, install the package fonts-powerline
zstyle ':vcs_info:git:*' formats ' %b'
#zstyle ':vcs_info:git:*' formats $(echo "\ue0a0")' %b'
RPROMPT=\$vcs_info_msg_0_
# ===== End Github ====

#PROMPT=$'\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000000     # indicates how many commands from your history file are loaded into the shell’s memory
SAVEHIST=$HISTSIZE      # indicates how many commands your history file can hold (you want this equal or larger than HISTSIZE)

setopt share_history    # share command history between all sessions
setopt hist_ignore_dups # ignore duplicated commands history list
setopt hist_ignore_all_dups # Delete old recorded entry if new entry is a duplicate
setopt autocd extendedglob  # change directory without the cd command
setopt always_to_end	# le curseur part a la fin apres la completion
setopt no_hup		# On ne tue pas les sous-process ...
setopt no_check_jobs	# ... en sortant
setopt interactive_comments # words beginning by '#' will be ignored up to a newline

# Binkeys
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/'$(id -un)'/.zshrc'
# zsh completion system
autoload -Uz compinit
compinit
# End of lines added by compinstall
# small letters will match small and capital letters
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#Aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

autoload -U colors && colors

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
      export PATH="${HOME}/bin:/sbin:${PATH}"
fi
export PATH=/usr/sbin:$PATH

# load autojump
if [ -f /usr/share/autojump/autojump.zsh ]; then
  . /usr/share/autojump/autojump.zsh
fi

# Affichage automatique du repertoire dans la 
# barre de titre du terminal
chpwd() {
  [[ -t 1 ]] || return
  case $TERM in
     *xterm*|rxvt|rxvt-unicode|(dt|k|E)term) print -Pn "\e]2;%n@%m%%%~\a"
      ;;
  esac
}

chpwd

# Load zsh-syntax-highlighting; should be last.
source /opt/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Load zsh-autosuggestions;
source /opt/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Load zsh-completions;
source /opt/zsh-plugins/zsh-completions/zsh-completions.plugin.zsh 2>/dev/null

# for firefox, so that the touchscreen works like on smartphones
#export MOZ_USE_XINPUT2=1
# to avoid (gtk) dbind-warning, when opening GUI
#export NO_AT_BRIDGE=1
