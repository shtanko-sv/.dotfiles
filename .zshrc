ZSH_DIR=$HOME/.zsh

source $ZSH_DIR/aliases.sh

# History configuration
HISTFILE=$ZSH_DIR/history
HISTSIZE=2000
SAVEHIST=2000
setopt HIST_SAVE_NO_DUPS

# Complition configuration
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# zsh-z configuration
ZSHZ_DATA=$ZSH_DIR/z.data

PLUGINS_DIR=$ZSH_DIR/plugins

for plugin in $(ls $PLUGINS_DIR); do
  source $PLUGINS_DIR/$plugin/*.zsh
done
