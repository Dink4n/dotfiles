call plug#begin('~/.vim/plugged')

" ---Better syntax Support---
Plug 'sheerun/vim-polyglot'
"    ---Useful Stuff---
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
"   ---Auto Completion---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"      ---Themes---
Plug 'sainnhe/gruvbox-material'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/forest-night'
"    ---Status Line---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"     ---Undo Tree---
Plug 'mbbill/undotree'
"        ---Git---
Plug 'tpope/vim-fugitive'
"    ---Fuzzy Search---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"     ---Grepping---
Plug 'mileszs/ack.vim'

call plug#end()
