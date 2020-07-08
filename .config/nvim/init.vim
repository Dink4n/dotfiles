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
set hidden
set wildmenu
set guicursor=
set cursorline
set laststatus=2
set showtabline=4
set scrolloff=8
set noerrorbells
set backspace=indent,eol,start

"---Search options---
set incsearch
set nohlsearch
set smartcase

"---Misc---
set noswapfile
set nobackup
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set termguicolors
set shortmess+=c
set clipboard=unnamedplus
set updatetime=50
set noshowmode

" Set Map leader
let mapleader = " " 

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'gruvbox-community/gruvbox'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox
