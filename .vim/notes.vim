for server in split(serverlist(), '\n')
  if server =~? "^NOTES\\d*" && server != v:servername
    call remote_foreground('NOTES')
    quit
  endif
endfor
"let $VIMHOME = expand('<sfile>:p:h')
"let g:vimwiki_list = [{'path': '$VIMHOME/wiki/src', 'path_html': '$VIMHOME/wiki/html'}]

let $WIKI_HOME = "$HOME/wiki/"

let g:vimwiki_list = [{'path': '$WIKI_HOME/MainWiki/', 'path_html': '$WIKI_HOME/public_html/vimwiki/MainWiki', 'syntax': 'markdown', 'ext': '.vimwiki'},{'path': '$WIKI_HOME/WorkWiki/', 'path_html': '$WIKI_HOME/vimwiki/WorkWiki', 'syntax': 'markdown', 'ext': '.vimwiki'}]
source $HOME/.vimrc
set titlestring=Notes
"autocmd FileType vimwiki autocmd BufWritePost <buffer> silent Vimwiki2HTML
"autocmd VimEnter * cd $VIMHOME | VimwikiIndex
let g:vimwiki_folding='list'
autocmd FileType vimwiki setlocal tabstop=4 expandtab
"autocmd VimEnter * execute "normal 2\\ww" | VimwikiIndex 
