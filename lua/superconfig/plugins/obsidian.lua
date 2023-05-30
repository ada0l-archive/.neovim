return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    cmd = {
      "ObsidianBacklinks",
      "ObsidianToday",
      "ObsidianYesterday",
      "ObsidianOpen",
      "ObsidianNew",
      "ObsidianSearch",
      "ObsidianQuickSwitch",
      "ObsidianLink",
      "ObsidianFollowLink",
      "ObsidianTemplate",
    },
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
        local suffix = ""
        if title ~= nil then
          suffix = title
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(suffix)
      end,
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
    end,
  },
}
