" Gruvbox
let g:gruvbox_contrast_dark     = 'hard'
let g:gruvbox_invert_selection  = '0'
let g:gruvbox_italic            = '1'

" Everforest
let g:everforest_background = "hard"
let g:everforest_enable_italic = 1
let g:everforest_transparent_background = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_diagnostic_virtual_text = 'colored'

" Nord
let g:nord_borders = 1
let g:nord_disable_background = 1


" Tokyonight.nvim
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = v:false
let g:tokyonight_italic_comments = v:true

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox
set background=dark

" Tokyonight
" highlight NonText guifg=#3b4057
