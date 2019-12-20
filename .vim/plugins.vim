" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
augroup VimDiff
    autocmd!
    autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END

" Lightline
let g:lightline = {
\    'colorscheme': 'Tomorrow',
\    'active': {
\        'left':[ [ 'mode', 'paste'],
\                 [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\        'right':[ [ 'lineinfo' ], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok'] ]
\    },
\    'component': {
\        'lineinfo': ' %3l:%-2v',
\    },
\    'component-function': {
\        'gitbranch': 'fugitive#head',
\    },
\    'component_expand': {
\        'linter_warnings': 'LightlineLinterWarnings',
\        'linter_errors': 'LightlineLinterErrors',
\        'linter_ok': 'LightlineLinterOK'
\    },
\    'component_type': {
\        'readonly': 'error',
\        'linter_warnings': 'warning',
\        'linter_errors': 'error'
\    },
\}
let g:lightline.tabline = {
\    'left': [ ['tabs'] ],
\    'right': [ ['close'] ]
\}
function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
    if exists('#lightline')
        call lightline#update()
    end
endfunction

" Update the lightline scheme from the colorscheme. Hopefully.
function! s:UpdateLightlineColorScheme()
    let g:lightline.colorscheme =
    g:colors_name
    call lightline#init()
endfunction

augroup _lightline
    autocmd!
    autocmd User ALELint call s:MaybeUpdateLightline()
    autocmd ColorScheme * call s:UpdateLightlineColorScheme()
augroup END

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
