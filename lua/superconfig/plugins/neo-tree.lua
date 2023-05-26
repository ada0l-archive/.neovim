return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "BufEnter",
    tag = "2.59",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
      { "nvim-tree/nvim-web-devicons", name = "tree-icons" },
      "MunifTanjim/nui.nvim",
    },
    cmd = { "NeoTreeFloatToggle", "NeoTreeShow" },
    opts = {
      popup_border_style = "single",
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
          },
        },
      },
    },
  },
}
