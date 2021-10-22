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
end
--
-- servers
local function config(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = custom_attach,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

lspconfig.clangd.setup(config({ cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu",
        },
    })
)

lspconfig.jedi_language_server.setup(config())
lspconfig.gopls.setup(config())
lspconfig.clangd.setup(config())
lspconfig.vimls.setup(config())
lspconfig.sumneko_lua.setup (config({
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
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
    })
)

local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.env.HOME .. '/.config/nvim/plugged/'
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require('luasnip.loaders.from_vscode').lazy_load({ paths = snippets_paths() })
