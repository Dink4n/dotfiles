" ---Enable syntax highlighting---
syntax enable

"---Indentation---
filetype plugin indent on
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nowrap

"---General settings---
set nu
set rnu
set hidden
set cursorline
set showtabline=4
set scrolloff=8
set noerrorbells

"---Search options---
set incsearch
set nohlsearch
set smartcase

"---Misc---
set nobackup
set nowritebackup
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile
set termguicolors
set shortmess+=c
set clipboard=unnamedplus
set showmode

" Give more space for displaying messages.  set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Set Map leader
let mapleader = " " 

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


"------Plugin Management------
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary' 
" Plug 'mhinz/vim-startify'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'

" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'chriskempson/base16-vim'
" Plug 'dylanaraps/wal.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'

call plug#end()

" ---Theme Settings---
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let python_highlight_all=1

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" ---Airline Settings---
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
" let g:airline_theme = 'ayu'

" Always show tabs
set showtabline=2

" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Enter insert mode automatically when entering term mode
"autocmd TermOpen * startinsert

vnoremap < <gv
vnoremap > >gv
nmap <Tab> :Tabnext<CR>
nmap <S-Tab> :Tabprev<CR>
nnoremap <Leader>ps :Rg<Space>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nmap <Leader>s <Plug>BujoAddnormal
nnoremap <silent> <TAB> :bnext<CR>
nmap <Leader>q <Plug>BujoChecknormal
nnoremap <silent> <S-TAB> :bprevious<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>rf :w<Bar>term python %<CR>
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
