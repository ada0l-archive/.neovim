return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require("which-key")

      wk.register({
        ["<leader>"] = {
          name = "Tree",
          n = { ":NeoTreeFloatToggle<CR>", "Tree float toggle" },
          N = { ":NeoTreeShow<CR>", "Tree show toggle" },
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
        }
      })
      wk.register({
        ["<leader>"] = {
          name = "Terminal",
          T = { ":!alacritty .<CR><CR>", "Terminal" },
        }
      })

      wk.register({
        ["<leader>"] = {
          name = "config",
          ["<leader>o"] = { ":tabnew ~/.config/nvim/init.lua<CR>", "Open config" },
          ["<leader>s"] = { ":ReloadConfig<CR>", "Reload config" },
        }
      })

      wk.register({
        ["<leader>"] = {
          name = "Tab navigation",
          ["1"] = { "1gt", "1 tab" },
          ["2"] = { "2gt", "2 tab" },
          ["3"] = { "3gt", "3 tab" },
          ["4"] = { "4gt", "4 tab" },
          ["5"] = { "5gt", "5 tab" },
          ["6"] = { "6gt", "6 tab" },
        }
      })


      wk.register({
        ["<leader>"] = {
          name = "Save & Quit",
          q    = { ":q<CR>", "Quit" },
          w    = { ":w<CR>", "Save" },
        }
      })

      wk.register({
        ["<leader>"] = {
          name = "Toggle cpp/h",
          ["<tab>"] = { ":e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>", "Toggle cpp/h" },
        }
      })
    end,
    opts =
    {
      layout = {
        height = { min = 10, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 },  -- min and max width of the columns
        align = "left",
      },
      triggers_nowait = {
        "<leader>h",
      },
      spacing = 2,
    }
  }
}
