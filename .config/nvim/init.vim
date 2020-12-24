"       ___               
"     /   |  ____  __  __
"    / /| | / __ \/ / / /
"   / ___ |/ / / / /_/ / 
"  /_/  |_/_/ /_/\__,_/  
                      
" Filename: init.vim
" Maintainer: Anu
" Github: https://github.com/Dink4n/dotfiles

" Basic Features: {{{
syntax enable                                 " Enable syntax-highlighting
filetype plugin indent on                     " enable filetype, plugin and indentation

set exrc
" set guicursor=                              " Disable cursor-styling
set guifont=Mononoki\ Nerd\ Font:h20        " Set the font for neovide
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

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" }}}

" Plugin Management: {{{

call plug#begin('~/.config/nvim/plugged')

" Completion/Syntax
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'norcalli/snippets.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/completion-treesitter'

" Debugger
" Plug 'puremourning/vimspector'
" Plug 'szw/vim-maximizer'

" TPOPE
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Utilities
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'rhysd/vim-clang-format'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/goyo.vim'
Plug 'jremmen/vim-ripgrep', { 'on': 'Rg' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ThePrimeagen/harpoon'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Colorschemes
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'danilo-augusto/vim-afterglow'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

" }}}

" Theme: {{{

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Theme Settings: {{{

" Gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
let g:gruvbox_italic = 1

" Nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_bold_vertical_split_line = 1

" Material
let g:material_theme_style  = 'palenight'
let g:material_terminal_italics = 1

" Oceanic Next
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" Afterglow
let g:afterglow_italic_comments = 1

" }}}

colorscheme material
set background=dark

" }}}

" Lua: {{{

lua require('init')
lua require('utilities')

" }}}

" Other: {{{

" Python is fake language
let python_highlight_all=1
let g:python3_host_prog='/usr/bin/python'

if executable('rg')
    let g:rg_derive_root='true'
endif

" Netrw is the best file manager
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" Some utitlity functions
function! MapTerminalCommand(ctrlId, key, command) abort
    execute printf('nnoremap <Leader>%s     :call SendTerminalCommand(%d, "%s\n")<CR>', a:key, a:ctrlId, a:command)
endfunction

function! MapDispatchCommand(key, dir, command) abort
    execute printf('nnoremap <Leader>%s     :call RunDispatchCommand("%s", "%s")<CR>', a:key, a:dir, a:command)
endfunction

function! RunDispatchCommand(dir, command) abort
    let rootDir = v:lua.utils.FindRoot()

    execute 'cd ' . a:dir
    execute 'Dispatch ' . a:command
    execute 'cd ' . l:rootDir
endfunction

function! GotoWindow(winId) abort
    call win_gotoid(a:winId)
    MaximizerToggle
endfunction

" AutoStart things
augroup STARTUP
    autocmd!
    au BufEnter github.com_*.txt set filetype=markdown
augroup END

augroup LANGS
    autocmd!
    autocmd BufEnter *.cpp,*.c  vmap <Leader>f :ClangFormat<CR>
augroup end


augroup Completion
    autocmd!
    autocmd BufEnter *         lua require'completion'.on_attach()
    autocmd BufEnter *         setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup end

" }}}

" Key Mappings: {{{

" ======= Useful ======
vnoremap < <gv
vnoremap > >gv

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
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

"  Terminal(Harpoon)
nnoremap <Leader>tsa    :call SetBuffer(0)<CR>
nnoremap <Leader>tss    :call SetBuffer(1)<CR>
nnoremap <Leader>tsd    :call SetBuffer(2)<CR>
nnoremap <Leader>tsf    :call SetBuffer(3)<CR>

nnoremap <Leader>ta     :call GotoBuffer(0)<CR>
nnoremap <Leader>ts     :call GotoBuffer(1)<CR>
nnoremap <Leader>td     :call GotoBuffer(2)<CR>
nnoremap <Leader>tf     :call GotoBuffer(3)<CR>

" Debugger
" nnoremap <Leader>m      :MaximizerToggle<CR>
" nnoremap <Leader>dd     :call vimspector#Launch()<CR>
" nnoremap <Leader>dt     :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" nnoremap <Leader>dv     :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <Leader>dw     :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <Leader>ds     :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <Leader>dc     :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <Leader>do     :call GotoWindow(g:vimspector_session_windows.output)<CR>
" nnoremap <Leader>dq     :call vimspector#Reset()<CR>

" nmap     <Leader>dl     <Plug>VimspectorStepOver
" nmap     <Leader>dj     <Plug>VimspectorStepInto
" nmap     <Leader>dk     <Plug>VimspectorStepOut
" nmap     <Leader>drs    <Plug>VimspectorRestart
" nmap     <Leader>d<space>   <Plug>VimspectorContinue
" nmap     <Leader>dp     <Plug>VimspectorPause

" nmap     <Leader>drc    <Plug>VimspectorRunToCursor
" nmap     <Leader>dtb    <Plug>VimspectorToggleBreakpoint
" nmap     <Leader>dtcb   <Plug>VimspectorToggleConditionalBreakpoint

" nnoremap <Leader>dcb    :call vimspector#ClearLineBreakpoint(expand("%"), line("."))<CR>

nnoremap <Leader>af     <C-^>
tnoremap <ESC>          <C-\><C-n>
nnoremap <Leader>pv     :Vexplore<CR>
nnoremap <Leader>u      :UndotreeShow<CR>
nnoremap <Leader><CR>   :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>pf     <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find{}<CR>
nnoremap <Leader>pw     <cmd>lua require("telescope.builtin").grep_string{ search = vim.fn.expand("<cword>") }<CR>
nnoremap <Leader>ps     <cmd>lua require("telescope.builtin").grep_string{ search = vim.fn.input("Grep for > ") }<CR>

if system("git rev-parse --git-dir 2> /dev/null") != "" 
    nnoremap <C-p>          <cmd>lua require('telescope.builtin').git_files{}<CR>
else
    nnoremap <C-p>          <cmd>lua require('telescope.builtin').find_files{}<CR>
endif

" }}}
