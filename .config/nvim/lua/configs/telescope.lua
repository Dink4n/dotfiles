local telescope = require('telescope')
local sorters = require('telescope.sorters')

telescope.setup {
    defaults = {
        sorting_strategy = "ascending",
        file_sorter = sorters.get_fzy_sorter,
        layout_config = {
            prompt_position = "top",
        },
        mappings = {
            i = {
                ["<c-a>"] = function() print("Hello, World!") end
            },
        },
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true
        },
    },
}

telescope.load_extension('fzy_native')

local M = {}
M.edit_neovim = function()
    require("telescope.builtin").find_files {
        prompt_title = "~ VimRc ~",
        cwd = "~/.config/nvim",
    }
end

return M
