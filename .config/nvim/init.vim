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
set pumheight=10
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


" ------ Plugin Management ------
call plug#begin('~/.config/nvim/plugged')

" ---- Intellisense ----
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'vim-syntastic/syntastic', { 'for': ['cpp', 'c'] }
" Plug 'neomake/neomake', { 'for': ['cpp', 'c'] }
Plug 'majutsushi/tagbar'
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jiangmiao/auto-pairs'
"
" ---- Useful ----
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary' 
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'
Plug 'sheerun/vim-polyglot'
" Plug 'vim-airline/vim-airline'

" ---- Themes ----
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'

call plug#end()
" ----------- End --------------

" ----------Theme Settings--------
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" ----- theme(s) settings -----
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_bold_vertical_split_line = 1

let g:gruvbox_italic=1

let g:palenight_terminal_italics=1

set background=dark
let ayucolor="dark"
colorscheme ayu
" ------------ END ---------------


"-------------- Language Settings ----------------
"--- Python ---
let python_highlight_all=1
let g:python3_host_prog='/usr/bin/python'

"--- C++/C ---
" syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

" formatting
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}"
"-------------------------------------------------

" ---------- Other -----------
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

if executable('rg')
    let g:rg_derive_root='true'
endif
" ---------------------------

" ----- Syntastic Settings -----
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Checkers
let g:syntastic_cpp_checkers = ['clang_tidy']
let g:syntastic_c_checkers = ['clang_tidy']
" ------------------------------

" ----- Airline Settings -----
" let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" ----------------------------

"------- Coc Extensions --------
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-vimlsp',
    \ 'coc-json',
    \ 'coc-python',
      \]

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction

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
command! -nargs=0 Prettier :CocCommand prettier.formatFile
func! CppFormatsettings()
    xmap <leader>f  :ClangFormat<CR>
    nmap <leader>f  :ClangFormat<CR>
endf
augroup cpp | au!
    au FileType c,cpp call CppFormatsettings()
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
nmap <leader>a  <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)

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
"======================

nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nmap <Leader>s <Plug>BujoAddnormal
nmap <Leader>q <Plug>BujoChecknormal
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>pv :Vexplore<CR>
