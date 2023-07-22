local map = require('ada0l.utils').map

map('n', '<leader><cr>', '<cmd>noh<cr>', { desc = 'Clean search', silent = true })

map('v', '<', '<gv', { desc = 'Shift left', silent = true })
map('v', '>', '>gv', { desc = 'Shift left', silent = true })

map('n', '<leader>cd', '<cmd>cd %:p:h<cr>:pwd<cr>', { desc = 'CD' })
map('n', '<leader>cx', '<cmd>!chmod +x %<cr>', { desc = 'Chmod +x', silent = true })

map('n', '[b', '<cmd>bnext<CR>', { desc = 'Next buffer', silent = true })
map('n', ']b', '<cmd>bprevious<CR>', { desc = 'Previous buffer', silent = true })

map('n', '<c-e>', '4<c-e>', { silent = true })
map('n', '<c-y>', '4<c-y>', { silent = true })

map({ 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard', noremap = false })
map({ 'n', 'v' }, '<leader>p', [["+p]], { desc = 'Paste from system clipboard', noremap = false })
