local telescope = require('telescope')
local sorters = require('telescope.sorters')

telescope.setup {
    defaults = {
        prompt_position = "top",
        sorting_strategy = "ascending",
        file_sorter = sorters.get_fzy_sorter,
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
