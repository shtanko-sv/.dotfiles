# zsh-z configuration
ZSHZ_DATA=$ZDOTDIR/.z

source $ZDOTDIR/aliases.sh

# History configuration
HISTFILE=$ZDOTDIR/history
HISTSIZE=2000
SAVEHIST=6000
setopt HIST_SAVE_NO_DUPS

# Completion configuration
autoload -Uz compinit
compinit -d $ZDOTDIR/compdump
zstyle ':completion:*' menu select

# Keys setup
bindkey -v

declare -A ZINIT
ZINIT[HOME_DIR]=${ZDOTDIR:-$HOME}/.zinit

if [[ ! -d $ZINIT[HOME_DIR] ]]; then
  git clone https://github.com/zdharma/zinit.git $ZINIT[HOME_DIR]/bin
fi

source $ZINIT[HOME_DIR]/bin/zinit.zsh

zinit load jeffreytse/zsh-vi-mode
zinit load agkozak/zsh-z
zinit load subnixr/minimal
zinit load ael-code/zsh-colored-man-pages
zinit load zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
