require("obsidian").setup({
  dir = "~/Documents/brain/",
  disable_frontmatter = true,
  daily_notes = {
    folder = "daily/",
  },
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
})

local wk = require("which-key")

wk.register({
  ["o"] = {
    ["bl"] = { ":ObsidianBacklinks<CR>", "ObsidianBacklinks" },
    ["t"] = { ":ObsidianToday<CR>", "ObsidianToday" },
    ["y"] = { ":ObsidianYesterday<CR>", "ObsidianYesterday" },
    ["o"] = { ":ObsidianOpen<CR>", "ObsidianOpen" },
    ["n"] = { ":ObsidianNew<CR>", "ObsidianNew" },
    ["s"] = { ":ObsidianSearch<CR>", "ObsidianSearch" },
    ["qs"] = { ":ObsidianQuickSwitch<CR>", "ObsidianQuickSwitch" },
    ["l"] = { ":ObsidianLink<CR>", "ObsidianLink" },
    ["ln"] = { ":ObsidianLinkNew<CR>", "ObsidianLinkNew" },
    ["fl"] = { ":ObsidianFollowLink<CR>", "ObsidianFollowLink" },
    ["it"] = { ":ObsidianTemplate<CR>", "ObsidianTemplate" },
  }
}, { prefix = "<leader>" })
