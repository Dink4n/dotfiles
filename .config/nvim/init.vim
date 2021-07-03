"     ____  _       __   __ __
"    / __ \(_)___  / /__/ // / ____
"   / / / / / __ \/ //_/ // /_/ __ \
"  / /_/ / / / / / ,< /__  __/ / / /
" /_____/_/_/ /_/_/|_|  /_/ /_/ /_/


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
Plug 'rhysd/vim-clang-format'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" Neovim TreeSitter
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" TPOPE
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Languages
Plug 'CaffeineViking/vim-glsl'

" Useful
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'folke/todo-comments.nvim'
Plug 'glepnir/dashboard-nvim'
" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-cheat.sh'

Plug 'vim-utils/vim-man'
Plug 'tjdevries/cyclist.vim'
Plug 'rhysd/accelerated-jk'
Plug 'tweekmonster/startuptime.vim'
Plug 'mbbill/undotree', { 'on': 'UndoTreeShow' }


" Statusline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'

" HARPOOOOOOOOONN!!!!!
Plug 'ThePrimeagen/harpoon'

" TELESCOPE
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Colorschemes
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'

Plug 'gruvbox-community/gruvbox'
Plug 'shaunsingh/nord.nvim'
Plug 'folke/tokyonight.nvim'

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

" Indent line
let g:indent_blankline_char='|'
let g:indent_blankline_space_char = '.'

" Trim trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup YANK_HIGHLIGHT
	au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

augroup STARTUP
    au!
    au BufEnter        *.vs,*.fs :set ft=glsl
    au BufWritePre     * :call TrimWhitespace()
    au BufWritePost    ~/.Xresources,~/.Xdefaults :silent !xrdb %
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
nnoremap <Leader>pv     :Vexplore<CR>
nnoremap <Leader>u      :UndotreeShow<CR>
nnoremap <Leader><CR>   :source ~/.config/nvim/init.vim<CR>

autocmd FileType c,cpp,objc nnoremap <Leader>f :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <Leader>f :ClangFormat<CR>
" }}}
