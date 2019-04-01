# Initialize completion
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select=4
zmodload zsh/complist

#Environment Variables
ORIENTDB_HOME=/Users/mquezada/Development/orientdb-community-2.2.33/
export ORIENTDB_HOME

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory

# Waiting Dots
COMPLETION_WAITING_DOTS="true"

# Use vim as the editor
export EDITOR=vim

# Use incremental search
bindkey "^R" history-incremental-search-backward

# Disable shell builtins
disable r
