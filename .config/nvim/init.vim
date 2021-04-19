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
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'
Plug 'norcalli/snippets.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Neovim TreeSitter
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" TPOPE
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Useful
Plug 'rhysd/accelerated-jk'
Plug 'mbbill/undotree'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" Statusline
Plug 'hoob3rt/lualine.nvim'

" HARPOOOOOOOOONN!!!!!
Plug 'ThePrimeagen/harpoon'

" Pretty icons
Plug 'kyazdani42/nvim-web-devicons'

" TELESCOPE
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Colorschemes
Plug 'tanvirtin/monokai.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
" }}}

" Other Things: {{{
" Python is fake language
let python_highlight_all=1
let g:python3_host_prog='/usr/bin/python'

if executable('rg')
    let g:rg_derive_root='true'
endif

" Some utitlity functions
function! ProjectCommand(key, command) abort
    execute printf('nnoremap <Leader>%s     :Dispatch %s<CR>', a:key, a:command)
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup STARTUP
    autocmd!
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
tnoremap <ESC>          <C-\><C-n>
nnoremap <Leader>pv     :Vexplore<CR>
nnoremap <Leader>u      :UndotreeShow<CR>
nnoremap <Leader><CR>   :source ~/.config/nvim/init.vim<CR>
" }}}
