# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit load ael-code/zsh-colored-man-pages
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit load zdharma/fast-syntax-highlighting

if [[ -f ${ZDOTDIR:-$HOME}/exports.sh ]]; then
  source ${ZDOTDIR:-$HOME}/exports.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source ${ZDOTDIR:-$HOME}/.p10k.zsh
