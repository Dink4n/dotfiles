nnoremap <C-p>          <cmd>lua require("telescope.builtin").git_files()<CR>
nnoremap <Leader>pf     <cmd>lua require("telescope.builtin").find_files()<CR>
nnoremap <Leader>pw     <cmd>lua require("telescope.builtin").live_grep()<CR>
nnoremap <Leader>ps     <cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>
nnoremap <Leader>vrc    <cmd>lua require("configs.telescope").edit_neovim()<CR>
