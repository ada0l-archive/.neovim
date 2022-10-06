local utils = require('superconfig.utils')
local map = utils.map

require('superconfig.plugins.telescope.mapping').init()
require('superconfig.plugins.nvim-tree.mapping').init()

-- open init.lua
map('n', '<leader><leader>o', ':tabnew ~/AppData/Local/nvim/init.lua<CR>', {})

-- source init.lua
map('n', '<leader><leader>s', ':source ~/AppData/Local/nvim/init.lua<CR>', {})

-- scrolling with search
map('n', 'n', 'nzzzv', {})
map('n', 'N', 'Nzzzv', {})

-- esc in terminal mode
map('t', '<Esc>', '<C-\\><C-n>', {})

-- disable highlight
map('n', '<leader><cr>', ':noh<cr>', {})

-- cd
map('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', {})

-- split
map('n', '<bar>', ':vsplit<CR>', {}) -- that mean |
map('n', '_', ':split<CR>', {})

-- save, quit
map('n', '<leader>q', ':q<CR>', {})
map('n', '<leader>w', ':w<CR>', {})

-- better indenting
map('v', '>', '>gv', {})
map('v', '<', '<gv', {})

-- navigation between buffers
map('n', '<c-H>', ':bp<cr>', {})
map('n', '<c-L>', ':bn<cr>', {})
map('n', '<leader>bd', ':bd<cr>', {})
map('n', '<leader>bad', ':bufdo bd<cr>', {})
map('n', '<leader>bod', ':%bd|edit#|bd#<cr>', {})


map('n', '<c-e>', '5<c-e>', {})
map('n', '<c-y>', '5<c-y>', {})
