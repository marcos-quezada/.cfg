# Initialize completion
autoload -Uz compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*:commands' rehash 1
zmodload zsh/complist
complete -W "$(tldr 2>/dev/null --list)" tldr

#Environment Variables
ORIENTDB_HOME=/Users/mquezada/Development/orientdb-community-2.2.33/
export ORIENTDB_HOME
JETBRAINS_HOME=$HOME/.local/share/JetBrains/Toolbox/bin/
path+=($JETBRAINS_HOME)
export PATH

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
