-- require("lualine").setup {
--     options = {
--         theme = 'ayu',
--         section_separators =  '',
--         component_separators =  '',
--     },
--
--     sections = {
--         lualine_c = {
--             { 'diagnostics', sources = { 'nvim_lsp' } },
--             { 'filename', file_status = true }
--         },
--     },
-- }

-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

require('lualine').setup {
  options = {
    theme = 'horizon',
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    -- lualine_b = { 'filename', 'branch' },
    lualine_c = {
        { 'diagnostics', sources = { 'nvim_lsp' } },
        { 'filename', file_status = true }
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
