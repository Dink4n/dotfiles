" Gruvbox
let g:gruvbox_contrast_dark     = 'hard'
let g:gruvbox_invert_selection  = '0'
let g:gruvbox_italic            = 1

" Nord
let g:nord_italic                    = 1
let g:nord_italic_comments           = 1
let g:nord_underline                 = 1
let g:nord_bold_vertical_split_line  = 1

" Material
let g:material_terminal_italics  = 1
let g:material_theme_style       = 'palenight'

" Oceanic Next
let g:oceanic_next_terminal_bold   = 1
let g:oceanic_next_terminal_italic = 1

" Afterglow
let g:afterglow_italic_comments = 1

" Ayu
let ayucolor = "dark"

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme ayu
set background=dark

highlight Normal guibg=none
highlight SignColumn guibg=none
highlight CursorLineNr guibg=none
