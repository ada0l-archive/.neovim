local map = require('superconfig.utils').map
local M = {}

function M.init()
  map("n", "<leader>v", ":Vista<CR>")
end

return M
