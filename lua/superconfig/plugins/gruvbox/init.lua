vim.o.background = "dark"
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false, -- invert background for search, diffs, statuslines and errors
  contrast = "medium", -- can be "hard", "soft" or empty string
  overrides = {},
  transparent_mode = true,
})
vim.cmd [[ colorscheme gruvbox ]]
