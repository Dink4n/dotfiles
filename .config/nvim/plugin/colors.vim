" Gruvbox
let g:gruvbox_contrast_dark     = 'hard'
let g:gruvbox_invert_selection  = '0'
let g:gruvbox_italic            = 1

" Nord
let g:nord_italic                    = 1
let g:nord_italic_comments           = 1
let g:nord_underline                 = 1
let g:nord_bold_vertical_split_line  = 1

" Tokyonight.nvim
let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = v:true

" Material.nvim
let g:material_style            = 'deep ocean'
let g:material_borders          = v:true
let g:material_contrast         = v:false
let g:material_italic_comments  = v:true
let g:material_italic_keywords  = v:true
let g:material_italic_functions = v:true

" Ayu
let ayucolor = "dark"

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox
set background=dark

" highlight Normal guibg=None
" highlight SignColumn guibg=None
