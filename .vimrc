"---------------------
" Load Plugins (Vundle)
"---------------------
source $HOME/.vim/vundles.vim

"---------------------
" Basic Configuration
" --------------------
source $HOME/.vim/basic.vim

"---------------------
" Plugins configuration
"---------------------
source $HOME/.vim/plugins.vim

"---------------------
" Local customizations
"---------------------
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
