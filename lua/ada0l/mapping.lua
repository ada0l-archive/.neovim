local map = require('ada0l.utils').map

-- Russian keyboard mappings
local function escape(str)
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
local langmap = vim.fn.join({
  escape(ru_shift) .. ';' .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')

vim.opt.langmap = langmap

map('n', '<leader><cr>', '<cmd>noh<cr>', { desc = 'Clean search', silent = true })

map('v', '<', '<gv', { desc = 'Shift left', silent = true })
map('v', '>', '>gv', { desc = 'Shift left', silent = true })

map('n', '<leader>cd', '<cmd>cd %:p:h<cr>:pwd<cr>', { desc = 'cd' })
map('n', '<leader>cx', '<cmd>!chmod +x %<cr>', { desc = 'chmod +x', silent = true })

map('n', '[b', '<cmd>bnext<CR>', { desc = 'Next buffer', silent = true })
map('n', ']b', '<cmd>bprevious<CR>', { desc = 'Previous buffer', silent = true })

map('n', '<c-e>', '4<c-e>', { silent = true })
map('n', '<c-y>', '4<c-y>', { silent = true })

map('v', '<leader>y', [["+y]], { desc = 'Yank to system clipboard', noremap = false })
map('n', '<leader>p', [["+p]], { desc = 'Paste from system clipboard', noremap = false })
map('v', '<leader>p', [["+p]], { desc = 'Paste from system clipboard', noremap = false })

map('i', [[<Tab>]], [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map('i', [[<S-Tab>]], [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

map('n', '<leader>q', '<cmd>bd<cr>', { desc = "Delete buffer" })

map('c', '<C-p>', '<Up>', { silent = false })
map('c', '<C-n>', '<Down>', { silent = false })

map('n', 'ge', 'G', { desc = "Go to end of file" })
map('n', 'gh', '^', { desc = "Go to start of line" })
map('n', 'gl', '$', { desc = "Go to end of line" })
map('n', 'gc', function() require("ada0l.utils").goto_window("center") end, { desc = "Go to center of window" })
map('n', 'gt', function() require("ada0l.utils").goto_window("top") end, { desc = "Go to top of window" })
map('n', 'gb', function() require("ada0l.utils").goto_window("bottom") end, { desc = "Go to bottom of window" })
