return {
  {
    "stevearc/aerial.nvim",
    lazy = true,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    opts = {
      layout = { min_width = 20 },
      open_automatic = false,
    },
  },
}
