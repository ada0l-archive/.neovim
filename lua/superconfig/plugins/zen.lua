local wk = require("which-key")

require("zen-mode").setup({})

wk.register({
  ["<leader>"] = {
    name = "zen",
    z = { ":ZenMode<CR>", "zen" }
  }
})
