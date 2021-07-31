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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" TPOPE
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Languages
Plug 'CaffeineViking/vim-glsl', { 'for': 'glsl' }

" Useful
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'folke/todo-comments.nvim'

Plug 'mhinz/vim-startify'
Plug 'tjdevries/cyclist.vim'
Plug 'rhysd/accelerated-jk'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tweekmonster/startuptime.vim'
Plug 'mbbill/undotree', { 'on': 'UndoTreeShow' }

" Statusline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'

" HARPOOOOOOOOONN!!!!!
Plug 'ThePrimeagen/harpoon'

" TELESCOPE
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'do': 'make' }

" Colorschemes
Plug 'sainnhe/everforest'

Plug 'gruvbox-community/gruvbox'
Plug 'shaunsingh/nord.nvim'
Plug 'folke/tokyonight.nvim'

call plug#end()
" }}}

" Lua {{{
lua << EOF
require('configs')
require('trouble').setup()
require('todo-comments').setup()
EOF
" }}}

" Other Things: {{{
" Python is fake language
let python_highlight_all=1
let g:python3_host_prog='/usr/bin/python'

" Vim startify
let g:startify_custom_header =
            \ startify#pad(split(system('fortune | cowsay -f dragon-and-cow'), '\n'))

" Cyclist
silent call cyclist#set_tab("default", "│ ")
silent call cyclist#add_listchar_option_set("clean", {}, v:false)
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
    au FileType             *.vs,*.fs  :set ft=glsl
augroup END

augroup STARTUP
    au!
    au BufWritePre     *                            :call TrimWhitespace()
    au BufWritePost    ~/.Xresources,~/.Xdefaults   :silent !xrdb %
augroup END
" }}}

" Key Mappings: {{{
nmap     k <Plug>(accelerated_jk_gk)
nmap     j <Plug>(accelerated_jk_gj)
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
inoremap <C-j> <Esc>:m .+1<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==
nnoremap <Leader>k :m .-2<CR>==
nnoremap <Leader>j :m .+1<CR>==

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
