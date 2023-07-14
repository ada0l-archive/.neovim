return {
  {
    "echasnovski/mini.statusline",
    version = "*",
    opts = {},
  },
  {
    "echasnovski/mini.cursorword",
    version = "*",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "▏",
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      show_current_context = true,
      show_current_context_start = false,
      show_trailing_blankline_indent = false,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
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
      custom_highlights = function(colors)
        return {
          Pmenu = { bg = colors.surface0 },
          NeoTreeFloatBorder = { bg = "none" },
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        telescope = true,
        nvimtree = true,
        which_key = true,
        aerial = true,
        fidget = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    },
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
}
