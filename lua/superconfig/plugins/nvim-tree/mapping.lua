local map = require('superconfig.utils').map
local M = {}

function M.init()
  map('n', '<leader>n', ':NvimTreeToggle<CR>')
  map('n', '<leader>N', ':NvimTreeFindFileToggle<CR>')
  map('n', '<leader>r', ':NvimTreeRefresh<CR>')
end

return M
