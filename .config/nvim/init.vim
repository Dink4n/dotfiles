syntax enable                                 " Enable syntax-highlighting
filetype plugin indent on                     " enable filetype, plugin and indentation

set guicursor=                              " Disable cursor-styling
set guifont=FiraCode\ Nerd\ Font:h20        " Set font for neovide
set smartindent                             " Smart indentation
set tabstop=4 softtabstop=4                 " changing number of spaces tab counts for to 4
set shiftwidth=4                            " Number of spaces to use for each step of indent
set expandtab                               " Change tabs to spaces
set nowrap                                  " Disable that annoying wraping
set number                                  " Enable absolute number line
set relativenumber                          " Enable relative number line
set hidden                                  " Help hidden
set cursorline
set noerrorbells                        
set incsearch
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

" Plugin Management {{{
call plug#begin('~/.config/nvim/plugged')

" ---- Completion/Syntax ----
Plug 'neovim/nvim-lspconfig'                " Builtin LSP client
Plug 'nvim-lua/completion-nvim'             " Better autocompletion
Plug 'octol/vim-cpp-enhanced-highlight'     " Better syntax hightlighting for cpp
Plug 'sheerun/vim-polyglot'                 " Overall Better syntax highlighting

" ---- Useful ----
Plug 'tpope/vim-fugitive'                   " Git client in vim
Plug 'tpope/vim-commentary'                 " Comments stuff for you
Plug 'tpope/vim-surround'                   " Makes surrounding easy
Plug 'tpope/vim-dispatch'                   " Async test and build dispatcher
Plug 'junegunn/fzf',
    \ { 'do': { -> fzf#install() } }        " this makes Fuzzy finder work
Plug 'junegunn/fzf.vim'                     " Fuzzy finder
Plug 'nvim-lua/plenary.nvim'                " Dependencies
Plug 'nvim-lua/popup.nvim'                  " Dependencies
Plug 'nvim-lua/telescope.nvim'              " Another Fuzzy finder
Plug 'mbbill/undotree'                      " Amazing undo tree
Plug 'jiangmiao/auto-pairs'                 " Auto pairs stuff for you
Plug 'jremmen/vim-ripgrep'                  " Really fast grep
Plug 'majutsushi/tagbar'                    " Tagbar on the side
Plug 'unblevable/quick-scope'               " Hightlight unique character in every word
Plug 'ThePrimeagen/vim-apm'                 " Vim actions per minute

" ---- Themes ----
Plug 'gruvbox-community/gruvbox'            " Best colorscheme of alltime
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'             " Very calming colorscheme
Plug 'sainnhe/forest-night'

call plug#end()
" }}}

" Theme Settings {{{

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

" LSP {{{

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set matching strategy to have a better completion experience
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.vimls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.jsonls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }

"  }}}

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

vnoremap < <gv
vnoremap > >gv
nmap <F8> :TagbarToggle<CR>
nnoremap <Leader>ps :Rg<Space>

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

" ======= LSP =========
nnoremap <Leader>ld     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>lh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>li     <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>lt     <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <Leader>lr     <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <Leader>lca    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <Leader>lrn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>lsd    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
" =====================

" Black hole remaps
" vnoremap <Leader>d      "_dp
" vnoremap <Leader>c      "_dp

" ================
nnoremap <Leader>u      :UndotreeShow<CR>
nnoremap <C-p>          :GFiles<CR>
nnoremap <Leader>pf     :Files<CR>
nnoremap <Leader>pc     :Colors<CR>
nnoremap <leader>pw     :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw    :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader><CR>   :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>pv     :Vexplore<CR>
tnoremap <ESC>          <C-\><C-n>

" language specific remaps
" autocmd FileType cpp :nnoremap <F5> <cmd>call CompileAndRun(&ft)<CR>
" autocmd FileType c   :nnoremap <F5> <cmd>call CompileAndRun(&ft)<CR>

" }}}
