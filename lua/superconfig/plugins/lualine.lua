return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        disabled_filetypes = { "NvimTree", "vista", "aerial" },
        always_divide_middle = true,
        globalstatus = false,
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          { "filetype", icon_only = true },
          "filename",
          "diagnostics",
        },
        lualine_x = { "encoding", "fileformat" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
