local map = require('superconfig.utils').map
local M = {}

function M.init()
  map("n", "<leader>ff", ":Telescope find_files<CR>")
  map("n", "<leader>fg", ":Telescope live_grep<CR>")
  map("n", "<leader>fb", ":Telescope buffers<CR>")
  map("n", "<leader>fc", ":Telescope colorscheme<CR>")
end

return M
