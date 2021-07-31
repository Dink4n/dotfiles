local lspconfig = require("lspconfig")

local lspconfig_root = vim.fn.stdpath("cache") .. "/lspconfig"
local sumneko_root_path = lspconfig_root .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local custom_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
            border = "single"
        }
    })

    local map = function(mode, key, result)
        vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd> " .. result .. "<CR>", {
            noremap = true, silent = true
        })
    end

    map('n', 'gd',      'lua vim.lsp.buf.definition()')
    map('n', 'gK',      'Lspsaga hover_doc')
    map('n', 'gi',      'lua vim.lsp.buf.implementation()')
    map('n', 'gD',      'lua vim.lsp.buf.declaration()')
    map('n', 'gs',      'Lspsaga signature_help')
    map('n', 'gt',      'lua vim.lsp.buf.type_definition()')
    map('n', 'grr',     'lua require("telescope.builtin").lsp_references()')
    map('n', 'grn',     'Lspsaga rename')
    map('n', 'gca',     'Lspsaga code_action')
    map('n', '<C-f>',   'lua require("lspsaga.action").smart_scroll_with_saga(1)')
    map('n', '<C-b>',   'lua require("lspsaga.action").smart_scroll_with_saga(-1)')

    -- Diagnostics
    map('n', '<Leader>sl', 'Lspsaga show_line_diagnostics')
    map('n', '<Leader>dn', 'Lspsaga diagnostic_jump_next')
    map('n', '<Leader>dp', 'Lspsaga diagnostic_jump_prev')
end

-- servers
lspconfig.clangd.setup {
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu",
    },

    on_attach = custom_attach,
}
lspconfig.jedi_language_server.setup { on_attach = custom_attach }
lspconfig.gopls.setup { on_attach = custom_attach }
lspconfig.clangd.setup { on_attach = custom_attach }
lspconfig.vimls.setup { on_attach = custom_attach }
lspconfig.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    on_attach = custom_attach;
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}
