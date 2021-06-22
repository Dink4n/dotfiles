"      ___
"     /   |  ____  __  __
"    / /| | / __ \/ / / /
"   / ___ |/ / / / /_/ /
"  /_/  |_/_/ /_/\__,_/

" Filename: init.vim
" Maintainer: Anu
" Github: https://github.com/Dink4n/dotfiles

" Things: {{{
set exrc
let mapleader = " "
" }}}

" Plugin Management: {{{
call plug#begin('~/.config/nvim/plugged')

" Lsp stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/lsp-trouble.nvim'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" Neovim TreeSitter
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" TPOPE
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Languages
Plug 'CaffeineViking/vim-glsl'

" Useful
Plug 'folke/todo-comments.nvim'
Plug 'rhysd/accelerated-jk'
Plug 'rhysd/vim-clang-format'
Plug 'mbbill/undotree'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" Web Stuff
Plug 'mattn/emmet-vim'

" Statusline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'

" HARPOOOOOOOOONN!!!!!
Plug 'ThePrimeagen/harpoon'

" TELESCOPE
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Colorschemes
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'

Plug 'gruvbox-community/gruvbox'
Plug 'shaunsingh/nord.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
" }}}

" Lua {{{
lua << EOF
require('configs')
require('nvim-treesitter.configs').setup { highlight = { enable = true } }
require('trouble').setup()
require('todo-comments').setup()
EOF
" }}}

" Other Things: {{{
" Python is fake language
let python_highlight_all=1
let g:python3_host_prog='/usr/bin/python'

if executable('rg')
    let g:rg_derive_root='true'
endif


" Trim trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup STARTUP
    autocmd!
    autocmd BufEnter        *.vs,*.fs :set ft=glsl
    autocmd BufWritePre     * :call TrimWhitespace()
    autocmd BufWritePost    ~/.Xresources,~/.Xdefaults :silent !xrdb %
augroup END
" }}}

" Key Mappings: {{{
" ======= Useful ======
nmap     k <Plug>(accelerated_jk_gk)
nmap     j <Plug>(accelerated_jk_gj)
vnoremap < <gv
vnoremap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>Y gg"+yG
" ====================

nnoremap <Leader>af     <C-^>
" tnoremap <ESC>          <C-\><C-n>
nnoremap <Leader>pv     :Vexplore<CR>
nnoremap <Leader>u      :UndotreeShow<CR>
nnoremap <Leader><CR>   :source ~/.config/nvim/init.vim<CR>
" }}}
