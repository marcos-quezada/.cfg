#Get OS
_myos="$(uname)"

# Use config alias to keep track of changes on repository.
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Use colors in coreutils utilities output
case $_myos in
  Linux)
	  alias ls='ls --color=auto'
	  alias grep='grep --color'
	  ;;
  Darwin) 
	  alias ls='ls -G'
	  ;;
  *) ;;
esac

alias grep='grep --color'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

alias zshconfig="vim ~/.zshrc"

# Starts on desired wiki or default if no argument is provided.
vimnotes() {
    if [ $# -eq 0 ]; then
        vim -f --servername Notes -u ~/.vim/notes.vim -c VimwikiIndex
    else
        if [[ $1 =~ ^[0-9]{1,2}$ ]]; then
           vim -f --servername Notes -u ~/.vim/notes.vim -c "execute 'normal ${1}\\ww'"
        else
            echo "Invalid wiki index"
            return
        fi
    fi
}
