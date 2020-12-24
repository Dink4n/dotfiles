local nvim_lsp = require("lspconfig")
local completion = require("completion")

nvim_lsp.clangd.setup { on_attach = completion.on_attach }
nvim_lsp.sumneko_lua.setup {
    cmd = {
            "/home/anu/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server",
            "-E",
            "/home/anu/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua"
    },

    on_attach = completion.on_attach
}
nvim_lsp.tsserver.setup { on_attach = completion.on_attach }
nvim_lsp.vimls.setup { on_attach = completion.on_attach }

-- Mappings --
local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {
        noremap = true,
        silent = true
    })
end

function MyLspRename()
  local current_word = vim.fn.expand("<cword>")
  local plenary_window = require('plenary.window.float').percentage_range_window(0.5, 0.2)
  vim.api.nvim_buf_set_option(plenary_window.bufnr, 'buftype', 'prompt')
  vim.fn.prompt_setprompt(plenary_window.bufnr, string.format('Rename "%s" to > ', current_word))
  vim.fn.prompt_setcallback(plenary_window.bufnr, function(text)
    vim.api.nvim_win_close(plenary_window.win_id, true)

    if text ~= '' then
      vim.schedule(function()
        vim.api.nvim_buf_delete(plenary_window.bufnr, { force = true })

        vim.lsp.buf.rename(text)
      end)
    else
      print("Nothing to rename!")
    end
  end)

  vim.cmd [[startinsert]]
end

mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
mapper('n', 'gK', '<cmd>lua vim.lsp.buf.hover()<CR>')
mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
mapper('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
mapper('n', 'gca', '<cmd>lua require("telescope.builtin").lsp_code_actions{}<CR>')
mapper('n', 'grn', '<cmd>lua MyLspRename()<CR>')

-- Diagnostics
mapper('n', 'dsl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
mapper('n', 'dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
mapper('n', 'dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

mapper('n', '<Leader>rs', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd("edit")<CR>')

-- mapper('n', 'gds',  "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
-- mapper('n', 'gws', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
