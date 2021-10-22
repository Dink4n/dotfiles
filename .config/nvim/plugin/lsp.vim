nnoremap    gd      <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap    gK      <cmd>Lspsaga hover_doc<CR>
nnoremap    gi      <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap    gD      <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap    gs      <cmd>Lspsaga signature_help<CR>
nnoremap    gt      <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap    grr     <cmd>lua require("telescope.builtin").lsp_references()<CR>
nnoremap    grn     <cmd>Lspsaga rename<CR>
nnoremap    gca     <cmd>Lspsaga code_action<CR>
nnoremap    <C-f>   <cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>
nnoremap    <C-b>   <cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>

" Diagnostics
nnoremap    <Leader>sl     <cmd>Lspsaga show_line_diagnostics<CR>
nnoremap    <Leader>dn     <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap    <Leader>dp     <cmd>Lspsaga diagnostic_jump_prev<CR>
