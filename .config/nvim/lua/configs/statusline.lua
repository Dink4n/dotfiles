require("lualine").setup {
    options = {
        section_separators =  '',
        component_separators =  '',
    },

    sections = {
        lualine_c = {
            { 'diagnostics', sources = { 'nvim_lsp' } },
            { 'filename', file_status = true }
        },
    },
}
