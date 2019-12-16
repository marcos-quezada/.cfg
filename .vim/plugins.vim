" Lightline
let g:lightline = {
\    'colorscheme': 'Tomorrow',
\    'active': {
\        'left':[ [ 'mode', 'paste'],
\                 [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\        ]
\    },
\    'component': {
\        'lineinfo': ' %3l:%-2v',
\    },
\    'component-function': {
\        'gitbranch': 'fugitive#head',
\    }
\}
let g:lightline.tabline = {
\    'left': [ ['tabs'] ],
\    'right': [ ['close'] ]
\}
set showtabline=2 " Show tabline
set guioptions-=e " Don't use GUI tabline

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" Command T
nnoremap <Leader>o :CommandT<CR>

" tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" gundo
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" ctrlp
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
\}
nnoremap <Leader>s :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>i :SyntasticInfo<CR>
nnoremap <Leader>m :SyntasticToggleMode<CR>

" markdown
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'coffee',
    \ 'elixir',
    \ 'erb=eruby',
    \ 'java',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'rust',
    \ 'yaml',
    \ 'go',
    \ 'powershell=ps1',
\]
