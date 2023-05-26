return {
  {
    "epwalsh/obsidian.nvim",
    opts = {
      dir = "~/Documents/SyncObsidian/",
      disable_frontmatter = true,
      daily_notes = {
        folder = "daily/",
      },
      notes_subdir = "notes",
      completion = {
        nvim_cmp = true,
      },
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          -- suffix = title:gsub(" ", "-"):gsub("[^А-Яа-яA-Za-z0-9-]", ""):lower()
          suffix = title
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(suffix)
      end
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
      local wk = require("which-key")
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
        }
      }, { prefix = "<leader>" })
    end
  }
}

