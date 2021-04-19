nnoremap <C-p>          <cmd>lua require("telescope.builtin").git_files()<CR>
nnoremap <Leader>pf     <cmd>lua require("telescope.builtin").find_files()<CR>
nnoremap <Leader>pw     <cmd>lua require("telescope.builtin").grep_string{ search = vim.fn.expand("<cword>") }<CR>
nnoremap <Leader>ps     <cmd>lua require("telescope.builtin").live_grep()<CR>
nnoremap <Leader>vrc    <cmd>lua require("configs.telescope").edit_neovim()<CR>
