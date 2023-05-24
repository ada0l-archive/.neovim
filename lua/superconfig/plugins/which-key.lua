local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    name = "Tree",
    n = { ":NeoTreeFloatToggle<CR>", "Tree float toggle" },
    N = { ":NeoTreeShow<CR>", "Tree show toggle" },
  }
})


wk.setup({
  layout = {
    height = { min = 10, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 },  -- min and max width of the columns
    align = "left",
  },
  triggers_nowait = {
    "<leader>h",
  },
  spacing = 2,
})

wk.register({
  ["<leader>"] = {
    name = "Terminal",
    T = { ":!gnome-terminal .<CR><CR>", "Terminal" },
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

-- wk.register({
--   ["<leader>"] = {
--     name = "Packer",
--     ps = { ":PackerSync<CR>", "Packer sync" },
--     pS = { ":PackerStatus<CR>", "Packer status" },
--     pc = { ":PackerCompile<CR>", "Packer compile" },
--   }
-- })
