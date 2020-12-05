local nvim_treesitter = require'nvim-treesitter.configs'

nvim_treesitter.setup {
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true }
}
