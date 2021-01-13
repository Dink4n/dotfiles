local completion = require("completion")
local api = vim.api

api.nvim_set_keymap(
    'i',
    '<Tab>',
    'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, expr = true }
)

api.nvim_set_keymap(
    'i',
    '<S-Tab>',
    'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"',
    { noremap = true, expr = true }
)

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_smart_case = 1

function CompleteMatchingLine()
  local current_line = api.nvim_get_current_line()
  current_line = vim.trim(current_line)

  if not current_line then
    print("You aren't on a line or something weird")
    return
  end

  local all_lines = api.nvim_buf_get_lines(0, 0, -1, false)

  local matching_lines = {}
  for _, v in ipairs(all_lines) do
    if string.find(v, current_line, 1, true) then
      table.insert(matching_lines, v)
    end
  end

  vim.fn.complete(1, matching_lines)

  return ''
end

-- vim.cmd [[inoremap <c-space> <c-r>=v:lua.CompleteMatchingLine()<CR>]]
vim.cmd [[inoremap <c-space> <C-x><C-o>]]
vim.cmd [[imap <c-n> <Plug>(completion_trigger)]]
