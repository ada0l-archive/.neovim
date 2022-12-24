local map = require('superconfig.utils').map
local M = {}

function M.init()
  map('n', '<leader>dd', ":GdbStart ")
  map('n', '<leader>db', ":GdbBreakpointToggle<CR>")
  map('n', '<leader>dc', ":GdbContinue<CR>")
  map('n', '<leader>dn', ":GdbNext<CR>")
end

return M
