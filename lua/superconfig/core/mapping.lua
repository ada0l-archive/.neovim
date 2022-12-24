local utils = require('superconfig.utils')
local map = utils.map

plugins_with_mapping = {
  'hop',
  'nvim-tree',
  'telescope',
  'vista'
}

for _, plugin in ipairs(plugins_with_mapping) do
  require('superconfig.plugins.' .. plugin .. '.mapping').init()
end

-- open init.lua
map('n', '<leader><leader>o', ':tabnew ~/AppData/Local/nvim/init.lua<CR>', {})

-- source init.lua
map('n', '<leader><leader>s', ':source ~/AppData/Local/nvim/init.lua<CR>', {})

-- scrolling with search
map('n', 'n', 'nzzzv', {})
map('n', 'N', 'Nzzzv', {})

-- esc in terminal mode
--map('t', '<ESC>', '<C-\\><C-n>', {})
map('t', '<c-K>', '<up>', {})
map('t', '<c-J>', '<down>', {})
map('n', '<leader>t', ':terminal<CR>', {})
map('n', '<leader>T', ':tabnew<CR>:terminal<CR>', {})

-- disable highlight
map('n', '<leader><cr>', ':noh<cr>', {})

-- disable annoying error woth auto complete
map('n', '<tab>', '', {})

-- cd
map('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', {})

-- split
map('n', '<bar>', ':vsplit<CR>', {}) -- that mean |
map('n', '_', ':split<CR>', {})

-- save, quit
map('n', '<leader>q', ':q<CR>', {})
map('n', '<leader>w', ':w<CR>', {})

-- navigation between tabs
map('n', '<leader>1', '1gt', {})
map('n', '<leader>2', '2gt', {})
map('n', '<leader>3', '3gt', {})
map('n', '<leader>4', '4gt', {})
map('n', '<leader>5', '5gt', {})
map('n', '<leader>6', '6gt', {})

-- navigation between buffers
map('n', '<c-H>', ':bp<cr>', {})
map('n', '<c-L>', ':bn<cr>', {})
map('n', '<leader>bd', ':bd<cr>', {})
map('n', '<leader>bad', ':bufdo bd<cr>', {})
map('n', '<leader>bod', ':%bd|edit#|bd#<cr>', {})

map('n', '<leader><tab>', ':e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>')

map('n', '<c-e>', '5<c-e>', {})
map('n', '<c-y>', '5<c-y>', {})

-- for maintain Visual Mode after shifting > and <
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})


-- Move visual block
vim.cmd[[
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
]]


vim.cmd[[
cno $h e ~/
cno $ttp cd D:/univer/5_semester/tiny-tiny-pascal/<CR>

cnoremap <c-P> <up>
cnoremap <c-N> <down>
]]
