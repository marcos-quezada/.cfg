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
alias zshconfig="vim ~/.zshrc"
alias sdkjava8="sdk use java 8.0.202-zulufx"
