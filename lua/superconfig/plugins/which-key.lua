return {
  {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.register({
        ["<leader>"] = {
          name = "Tree",
          n = { ":NeoTreeFloatToggle<CR>", "Tree float toggle" },
          N = { ":NeoTreeShow<CR>", "Tree show toggle" },
        },
      })

      wk.register({
        ["<leader>"] = {
          name = "Rest",
          rr = { "<Plug>RestNvim", "Rest" }
        }
      })

      wk.register({
        ["<leader>"] = {
          name = "Telescope",
          tt = { ":Telescope<CR>", "Telescope" },
          f = { ":Telescope find_files<CR>", "Files" },
          ["/"] = { ":Telescope live_grep<CR>", "Live grep" },
          b = { ":Telescope buffers<CR>", "Buffers" },
          p = { ":Telescope projects<CR>", "Projects" },
        },
      })

      wk.register({
        ["o"] = {
          ["b"] = { ":ObsidianBacklinks<CR>", "ObsidianBacklinks" },
          ["t"] = { ":ObsidianToday<CR>", "ObsidianToday" },
          ["y"] = { ":ObsidianYesterday<CR>", "ObsidianYesterday" },
          ["o"] = { ":ObsidianOpen<CR>", "ObsidianOpen" },
          ["n"] = { ":ObsidianNew<CR>", "ObsidianNew" },
          ["s"] = { ":ObsidianSearch<CR>", "ObsidianSearch" },
          ["q"] = { ":ObsidianQuickSwitch<CR>", "ObsidianQuickSwitch" },
          ["l"] = { ":ObsidianLink<CR>", "ObsidianLink" },
          ["f"] = { ":ObsidianFollowLink<CR>", "ObsidianFollowLink" },
          ["i"] = { ":ObsidianTemplate<CR>", "ObsidianTemplate" },
        },
      }, { prefix = "<leader>" })

      wk.register({
        ["<leader>"] = {
          name = "Terminal",
          ["<leader>"] = { ":terminal<CR>", "Terminal" },
        },
      })

      -- wk.register({
      --   ["<leader>"] = {
      --     name = "config",
      --     ["<leader>o"] = { ":tabnew ~/.config/nvim/init.lua<CR>", "Open config" },
      --     ["<leader>s"] = { ":ReloadConfig<CR>", "Reload config" },
      --   },
      -- })
      --
      wk.register({
        ["<leader>"] = {
          name = "Tab navigation",
          ["1"] = { "1gt", "1 tab" },
          ["2"] = { "2gt", "2 tab" },
          ["3"] = { "3gt", "3 tab" },
          ["4"] = { "4gt", "4 tab" },
          ["5"] = { "5gt", "5 tab" },
          ["6"] = { "6gt", "6 tab" },
        },
      })

      wk.register({
        ["<leader>"] = {
          name = "Save & Quit",
          q = { ":q<CR>", "Quit" },
          w = { ":w<CR>", "Save" },
        },
      })

      wk.register({
        ["<leader>"] = {
          name = "Toggle cpp/h",
          ["<tab>"] = { ":e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>", "Toggle cpp/h" },
        },
      })
    end,
    opts = {
      layout = {
        height = { min = 10, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        align = "left",
      },
      triggers_nowait = {
        "<leader>h",
      },
      spacing = 2,
    },
  },
}
