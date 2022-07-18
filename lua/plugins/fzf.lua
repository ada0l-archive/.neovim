local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map("n", "<leader>f", ":Telescope find_files<CR>", default_opts)
map("n", "<leader>g", ":Telescope git_files<CR>", default_opts)
map("n", "<leader>b", ":Telescope buffers<CR>", default_opts)

require('telescope').setup{}
