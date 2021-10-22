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
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

Plug 'tami5/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'romgrk/nvim-treesitter-context'

" TPOPE
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

" Languages
Plug 'CaffeineViking/vim-glsl', { 'for': 'glsl' }

" Some plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'simrat39/symbols-outline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'folke/todo-comments.nvim'
Plug 'folke/twilight.nvim'
Plug 'rhysd/vim-clang-format'
Plug 'ThePrimeagen/refactoring.nvim'

Plug 'tjdevries/cyclist.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeShow' }

" Statusline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'

" HARPOOOOOOOOONN!!!!!
Plug 'ThePrimeagen/harpoon'

" TELESCOPE
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'do': 'make' }

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim'

call plug#end()
" }}}

" Lua {{{
lua << EOF
require('configs')
require('trouble').setup()
require('todo-comments').setup()
require('twilight').setup()
EOF
" }}}

" Other Things: {{{
" Python is fake language
let python_highlight_all=1
let g:python3_host_prog='/usr/bin/python'

" Cyclist
silent call cyclist#set_eol("default", "")
silent call cyclist#set_tab("default", "│ ")
silent call cyclist#add_listchar_option_set("clean", { 'eol': '', 'tab': '  ' }, v:true)
silent call cyclist#add_listchar_option_set("debug", { 'space': '·' }, v:true)

" Trim trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup YANK_HIGHLIGHT
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

augroup FILETYPE_DETECT
    au!
    au TermOpen             *          setlocal nonumber norelativenumber
augroup END

augroup STARTUP
    au!
    au BufWritePre     *[^.md]                      :call TrimWhitespace()
    au BufWritePost    ~/.Xresources,~/.Xdefaults   :silent !xrdb %
augroup END
" }}}

" Key Mappings: {{{
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>Y gg"+yG

" Behave Vim
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <Esc>:m .+1<CR>==<Right><Insert>
inoremap <C-k> <Esc>:m .-2<CR>==<Right><Insert>

nnoremap <Leader>af     <C-^>
nnoremap <Leader>pv     :Vexplore<CR>
nnoremap <Leader>u      :UndoTreeShow<CR>
nnoremap <Leader><CR>   :source ~/.config/nvim/init.vim<CR>
nmap     <Leader>cn     <Plug>CyclistNext
nmap     <Leader>cp     <Plug>CyclistPrev

autocmd FileType c,cpp,objc nnoremap <Leader>f :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <Leader>f :ClangFormat<CR>
" }}}

" Commands: {{{
command! -bang -bar -range=-1 -complete=customlist,man#complete -nargs=* VMan
      \ if <bang>0 | set ft=man |
      \ else | call man#open_page(<count>, 'vertical', <f-args>) | endif
" }}}
