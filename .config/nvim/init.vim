"       ___               
"     /   |  ____  __  __
"    / /| | / __ \/ / / /
"   / ___ |/ / / / /_/ / 
"  /_/  |_/_/ /_/\__,_/  
                      
" Filename: init.vim
" Maintainer: Anu
" Github: https://github.com/JimboKearn/dotfiles

" Basic Features {{{
syntax enable                                 " Enable syntax-highlighting
filetype plugin indent on                     " enable filetype, plugin and indentation

set exrc
set guicursor=                              " Disable cursor-styling
set guifont=JetbrainsMono\ Nerd\ Font:h20        " Set font for neovide
set smartindent                             " Smart indentation
set tabstop=4 softtabstop=4                 " changing number of spaces tab counts for to 4
set shiftwidth=4                            " Number of spaces to use for each step of indent
set expandtab                               " Change tabs to spaces
set nowrap                                  " Disable that annoying wraping
set number                                  " Enable absolute number line
set relativenumber                          " Enable relative number line
set hidden                                  " I like switching buffers quickly
set cursorline
set noerrorbells                        
set incsearch
set inccommand=split
set nohlsearch
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set termguicolors
set pumheight=10
set scrolloff=8
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect
set foldmethod=marker

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Set Map leader
let mapleader = " " 

" Polyglot disabled languages
" let g:polyglot_disabled = ['c', 'cpp']

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" }}}

" Plugin Management {{{

lua require('plugins')

" }}}

" Lua {{{

lua require('init')

" }}}

" LSP {{{

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set matching strategy to have a better completion experience
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"  }}}

" Theme {{{

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_bold_vertical_split_line = 1

let g:gruvbox_italic=1

colorscheme gruvbox
set background=dark

" }}}

" Utilities {{{

" Language specific things 
let python_highlight_all=1
let g:python3_host_prog='/usr/bin/python'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1


if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" }}}

" Key Mappings {{{

" ======= Useful ======
vnoremap < <gv
vnoremap > >gv
nmap <F8> :TagbarToggle<CR>
" ====================

"======= Wincmd =======
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>J :wincmd J<CR>
nnoremap <Leader>K :wincmd K<CR>
nnoremap <Leader>L :wincmd L<CR>
nnoremap <Leader>H :wincmd H<CR>
nnoremap <Leader>= :wincmd =<CR>
nnoremap <Leader>o :wincmd o<CR>
"======================

" Black hole remaps
vnoremap <Leader>d      "_d

"  Harpoon
nnoremap <Leader>tsa    :call SetBuffer(0)<CR>
nnoremap <Leader>tss    :call SetBuffer(1)<CR>
nnoremap <Leader>tsd    :call SetBuffer(2)<CR>
nnoremap <Leader>tsf    :call SetBuffer(3)<CR>

nnoremap <Leader>ta    :call GotoBuffer(0)<CR>
nnoremap <Leader>ts    :call GotoBuffer(1)<CR>
nnoremap <Leader>td    :call GotoBuffer(2)<CR>
nnoremap <Leader>tf    :call GotoBuffer(3)<CR>

nnoremap <Leader>u      :UndotreeShow<CR>
nnoremap <Leader><CR>   :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>pv     :Vexplore<CR>
tnoremap <ESC>          <C-\><C-n>
nnoremap <Leader>af     <C-^>
nnoremap <Leader>pb     <cmd>lua require("telescope.builtin").buffers{}<CR>
nnoremap <Leader>pch    <cmd>lua require("telescope.builtin").command_history{}<CR>
nnoremap <Leader>pt     <cmd>lua require("telescope.builtin").help_tags{}<CR>
nnoremap <Leader>pm     <cmd>lua require("telescope.builtin").man_pages{}<CR>
nnoremap <Leader>pf     <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find{}<CR>

if system("git rev-parse --git-dir 2> /dev/null") != "" 
    nnoremap <C-p>          :lua require('telescope.builtin').git_files{}<CR>
    nnoremap <Leader>pw     <cmd>lua require("telescope.builtin").live_grep{ search = vim.fn.expand("<cword>") }<CR>
    nnoremap <Leader>ps     <cmd>lua require("telescope.builtin").live_grep{ search = vim.fn.input("Grep for > ") }<CR>
else
    nnoremap <C-p>          :lua require('telescope.builtin').find_files{}<CR>
    nnoremap <Leader>pw     <cmd>lua require("telescope.builtin").grep_string{ search = vim.fn.expand("<cword>") }<CR>
    nnoremap <Leader>ps     <cmd>lua require("telescope.builtin").grep_string{ search = vim.fn.input("Grep for > ") }<CR>
endif

" }}}
