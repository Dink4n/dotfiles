nnoremap <Leader>pf     <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find{}<CR>
nnoremap <Leader>pw     <cmd>lua require("telescope.builtin").grep_string{ search = vim.fn.expand("<cword>") }<CR>
nnoremap <Leader>ps     <cmd>lua require("telescope.builtin").grep_string{ search = vim.fn.input("Grep for > ") }<CR>

if system("git rev-parse --git-dir 2> /dev/null") != "" 
    nnoremap <C-p>          <cmd>lua require('telescope.builtin').git_files{}<CR>
else
    nnoremap <C-p>          <cmd>lua require('telescope.builtin').find_files{}<CR>
endif
