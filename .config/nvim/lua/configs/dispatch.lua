--> WIP <--
-- I don't think it works ;)

local M = {}
local util = require("lspconfig.util")

M.FindRootDir = function()
    local root_pattern = util.root_pattern("CMakeLists.txt", "compile_commands.json")
    local root_dir = root_pattern(vim.fn.expand("%:p"))

    return root_dir
end

M.SetupDispatch = function()
    if M.FindRootDir() == nil then
        return
    end

    local map = function(key, command)
        vim.api.nvim_buf_set_keymap(0, "n", key, "<cmd>" ..  command .. "<CR>", {
            noremap = true,
            silent = true
        })
    end

    local prog = vim.g.prog
    local buildType = vim.g.build_type

    if prog == nil then
        return
    end
    if buildType == nil then
        buildType = "Debug"
    end

    map("<Leader>pb", 'exe printf("Dispatch make -s -C temp/%s", g:build_type)')
    map("<Leader>pr", 'exe printf("Dispatch temp/%s/%s", g:build_type, g:prog)')
    map("<Leader>pg", 'exe printf("Dispatch! cmake -S . -B temp/%s -DCMAKE_BUILD_TYPE=%s", g:build_type, g:build_type)')
    map("<Leader>pc", "Dispatch! rm -rf temp/*")
end

vim.cmd [[ augroup DISPATCH ]]
vim.cmd [[ autocmd BufNewFile,BufReadPost *.c,*.h,*.cpp,CMakeLists.txt :lua require("configs/dispatch").SetupDispatch() ]]
vim.cmd [[ augroup END ]]

return M
