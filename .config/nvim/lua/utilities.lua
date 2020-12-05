utils = {}

function utils.FindRoot()
    return require'lspconfig'.util.root_pattern('.git', '.nvimrc', 'CMakeLists.txt', 'compile_commands.json')(vim.fn.expand("%:p"))
end
