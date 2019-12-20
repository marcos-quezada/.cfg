"---------------------
" Vundle initialization
"---------------------
source $HOME/.vim/init.vimrc

"---------------------
" General not fitting somewhere else
"---------------------
source $HOME/.vim/general.vimrc

"---------------------
" Plugins configuration
"---------------------
source $HOME/.vim/plugins.vimrc

"---------------------
" Keys bindings
"---------------------
source $HOME/.vim/keys.vimrc

"---------------------
" Statusline configuration
"---------------------
source $HOME/.vim/line.vimrc

"---------------------
" Local customizations
"---------------------
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
