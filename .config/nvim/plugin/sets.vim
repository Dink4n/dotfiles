" set guicursor=                              " Disable cursor-styling
set smartindent                             " Smart indentation
set tabstop=4 softtabstop=4                 " changing number of spaces tab counts for to 4
set shiftwidth=4                            " Number of spaces to use for each step of indent
" set expandtab                               " Change tabs to spaces
set nowrap                                  " Disable that annoying wraping
set number                                  " Enable absolute number line
set relativenumber                          " Enable relative number line
set hidden                                  " I like switching buffers quickly
set noerrorbells                            " Disable that retarded error sound
set cursorline                              " Line at cursor position
set incsearch                               " Search Incrementally
set inccommand=split                        " Cool menu when substituting
set nohlsearch                              " Don't highlight search results
set splitright                              " Split windows to the right
set noswapfile                              " Don't create swap files
set backup                                  " Create backups
set backupdir=$XDG_DATA_HOME/nvim/backup    " Directory to create backups
set undodir=~/.config/nvim/undodir          " Directory keep undofiles
set undofile                                " Create undofiles
set termguicolors                           " True terminal colors
set pumheight=10                            " Maximum 10 lines for completions
set pumblend=15                             " Blend the completion menu
set scrolloff=8                             " Always have 8 lines above and below the cursor
set clipboard=unnamedplus                   " Use all clpboards
set foldmethod=marker                       " Use marker as foldmethod
set signcolumn=yes                          " Column in the side

" Cursor blinking
set guicursor+=a:blinkwait500-blinkoff250-blinkon250-Cursor/lCursor
set guicursor+=sm:block-blinkwait175-blinkoff150-blinkon175

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set colorcolumn=80
