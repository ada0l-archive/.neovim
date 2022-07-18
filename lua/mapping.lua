local map = vim.api.nvim_set_keymap
local default_opts = require("util").default_opts
vim.g.mapleader = "\\"

-- open init.lua
map('n', '<leader><leader>o', ':tabnew ~/AppData/Local/nvim/init.lua<CR>', default_opts)

-- source init.lua
map('n', '<leader><leader>s', ':source ~/AppData/Local/nvim/init.lua<CR>', default_opts)

-- scrolling with search
map('n', 'n', 'nzzzv', default_opts)
map('n', 'N', 'Nzzzv', default_opts)

map('i', 'jk', '<Esc>', default_opts)

-- esc in terminal mode
map('t', '<Esc>', '<C-\\><C-n>', default_opts)

-- disable highlight
map('n', '<leader><cr>', ':noh<cr>', default_opts)

-- cd
map('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', default_opts)

-- split
map('n', '<leader>v', ':vsplit<CR>', default_opts)
map('n', '<leader>s', ':split<CR>', default_opts)

-- save, quit
map('n', '<leader>q', ':q<CR>', default_opts)
map('n', '<leader>w', ':w<CR>', default_opts)

-- Editing Mapping

-- better indenting
map('v', '>', '>gv', default_opts)
map('v', '<', '<gv', default_opts)

-- move line
--map('v', 'J', ':m '>+1<CR>gv=gv', default_opts)
--map('v', 'K', ':m '<-2<CR>gv=gv', default_opts)

-- navigation between buffers
map('n', 'gn', ':bn<cr>', default_opts)
map('n', 'gp', ':bp<cr>', default_opts)

map('n', '<c-e>', '5<c-e>', default_opts)
map('n', '<c-y>', '5<c-y>', default_opts)
