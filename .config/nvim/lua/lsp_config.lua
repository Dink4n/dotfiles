local nvim_lsp = require('lspconfig')
local completion = require("completion")

nvim_lsp.clangd.setup { on_attach = completion.on_attach }
nvim_lsp.vimls.setup { on_attach = completion.on_attach }
nvim_lsp.jsonls.setup { on_attach = completion.on_attach }
nvim_lsp.pyls.setup { on_attach = completion.on_attach }

-- Mappings --
local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {
        noremap = true,
        silent = true
    })
end

mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
mapper('n', 'gK', '<cmd>lua vim.lsp.buf.hover()<CR>')
mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
mapper('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
mapper('n', 'gca', '<cmd>lua require("telescope.builtin").lsp_code_actions{}<CR>')
mapper('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>')
mapper('n', 'gsd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
mapper('n', '<Leader>rs', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd("edit")<CR>')

-- mapper('n', 'gds',  "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
-- mapper('n', 'gws', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
