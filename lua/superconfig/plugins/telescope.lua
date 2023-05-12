local wk = require("which-key")
local actions = require "telescope.actions"


wk.register({
  ["<leader>"] = {
    name = "Telescope",
    tt = { ":Telescope<CR>", "Telescope" },
    tf = { ":Telescope find_files<CR>", "Files" },
    tb = { ":Telescope buffers<CR>", "Buffers" },
    tg = { ":Telescope git_branches<CR>", "Branches" },
    tp = { ":Telescope projects<CR>", "Projects" },
  }
})

require('telescope').setup {
  defaults = {
    layout_config = {
      vertical = { width = 1 },
    },
    file_ignore_patterns = {
      "node_modules", "build", "dist", "yarn.lock", "package-lock.json"
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      },
      previewer = false,
    },
    find_files = {
      previewer = false,
    }
  }
}
