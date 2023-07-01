return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    tag = "2.59",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>n",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "float" })
        end,
        desc = "NeoTree Toggle",
      },
    },
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
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    cmd = "Telescope projects",
    opts = {},
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim",                lazy = true },
      { "nvim-telescope/telescope-symbols.nvim" },
    },
    keys = {
      { "<leader>tt", ":Telescope<CR>",            desc = "Telescope" },
      { "<leader>f",  ":Telescope find_files<CR>", desc = "Files" },
      { "<leader>/",  ":Telescope live_grep<CR>",  desc = "Live grep" },
      { "<leader>b",  ":Telescope buffers<CR>",    desc = "Buffers" },
      { "<leader>p",  ":Telescope projects<CR>",   desc = "Projects" },
    },
    tag = "0.1.1",
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--no-config",
            "--no-ignore",
            "--color=never",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "-g=!.git",
            "-g=!.ccls-cache",
            "-g=!node_modules",
            "-g=!dist",
          },
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
  {
    "echasnovski/mini.jump2d",
    version = "*",
    lazy = true,
    keys = { "<CR>" },
    opts = {
      mappings = {
        start_jumping = "<CR>",
      },
      silent = false,
    },
    init = function()
      vim.cmd([[autocmd Filetype qf lua vim.b.minijump2d_disable = true]])
    end,
  },
  {
    "hkupty/nvimux",
    keys = {
      "<C-a>",
    },
    config = function()
      local nvimux = require("nvimux")
      nvimux.setup({
        config = {
          prefix = "<C-a>",
        },
        bindings = {
          { { "n", "v", "i", "t" }, "s", nvimux.commands.horizontal_split },
          { { "n", "v", "i", "t" }, "v", nvimux.commands.vertical_split },
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "[", "]" },
    opts = {},
  },
}
