for server in split(serverlist(), '\n')
  if server =~? "^NOTES\\d*" && server != v:servername
    call remote_foreground('NOTES')
    quit
  endif
endfor
let $VIMHOME = expand('<sfile>:p:h')
let g:vimwiki_list = [{'path': '$VIMHOME/wiki/src', 'path_html': '$VIMHOME/wiki/html'}]
source $HOME/.vimrc
set titlestring=Notes
autocmd FileType vimwiki autocmd BufWritePost <buffer> silent Vimwiki2HTML
autocmd VimEnter * cd $VIMHOME | VimwikiIndex
