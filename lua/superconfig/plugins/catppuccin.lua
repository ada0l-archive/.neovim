local catppuccin = require("catppuccin")
local colors = require("catppuccin.palettes").get_palette("mocha")

catppuccin.setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = false,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false,    -- Force no italic
  no_bold = false,      -- Force no bold
  no_underline = false, -- Force no underline
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
  },
  custom_highlights = {
    Pmenu = { bg = colors.surface0 }
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    neotree = true,
    telescope = true,
    nvimtree = true,
  },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
