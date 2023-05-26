return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    tag = "0.1.1",
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          layout_config = {
            vertical = { width = 1 },
          },
          file_ignore_patterns = {
            "node_modules",
            "build",
            "dist",
            "yarn.lock",
            "package-lock.json",
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
              },
            },
            previewer = false,
          },
          find_files = {
            previewer = false,
          },
        },
      }
    end,
  },
}
