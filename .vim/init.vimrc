"--------------
" Load vundle
"--------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/wincent/command-t.git'
Plugin 'https://github.com/editorconfig/editorconfig-vim.git'
Plugin 'https://github.com/sjl/gundo.vim.git'
Plugin 'https://github.com/itchyny/lightline.vim.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/rust-lang/rust.vim.git'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'https://github.com/kchmck/vim-coffee-script.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/tpope/vim-git.git'
Plugin 'https://github.com/pangloss/vim-javascript.git'
Plugin 'https://github.com/elzr/vim-json.git'
Plugin 'https://github.com/groenewege/vim-less.git'
Plugin 'https://github.com/tpope/vim-markdown.git'
Plugin 'https://github.com/vimwiki/vimwiki.git'
Plugin 'https://github.com/zigford/vim-powershell.git'
Plugin 'https://github.com/jiangmiao/auto-pairs.git'
Plugin 'https://github.com/tpope/vim-commentary.git'
Plugin 'https://github.com/dense-analysis/ale.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
