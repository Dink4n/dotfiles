let g:clang_format#style_options = {
            \ "Language": "Cpp",
            \ "IndentWidth": 4,
            \ "TabWidth": 4,
            \ "UseTabs": "Never",
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "False",
            \ "BreakBeforeBraces" : "Linux"}

autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
