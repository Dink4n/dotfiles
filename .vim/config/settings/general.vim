" ---Enable syntax highlighting---
syntax enable

"---Indentation---
set autoindent
filetype plugin indent on
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nowrap

"---General settings---
set nu
set rnu
set ruler
set hidden
set wildmenu
set cursorline
set noshowmatch
set laststatus=2
set showtabline=4
set scrolloff=8
set splitright
set splitbelow
set noerrorbells
set backspace=indent,eol,start

"---Search options---
set incsearch
set nohlsearch
set smartcase

"---Misc---
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set guicursor=
set termguicolors
set shortmess+=c
set clipboard=unnamedplus
set updatetime=50
set noshowmode

" Set Map leader
let mapleader = " " 

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
