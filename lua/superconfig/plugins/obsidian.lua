return {
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		keys = {
			{ "<leader>ob", ":ObsidianBacklinks<CR>", desc = "ObsidianBacklinks" },
			{ "<leader>ot", ":ObsidianToday<CR>", desc = "ObsidianToday" },
			{ "<leader>oy", ":ObsidianYesterday<CR>", desc = "ObsidianYesterday" },
			{ "<leader>oo", ":ObsidianOpen<CR>", desc = "ObsidianOpen" },
			{ "<leader>on", ":ObsidianNew<CR>", desc = "ObsidianNew" },
			{ "<leader>os", ":ObsidianSearch<CR>", desc = "ObsidianSearch" },
			{ "<leader>oq", ":ObsidianQuickSwitch<CR>", desc = "ObsidianQuickSwitch" },
			{ "<leader>ol", ":ObsidianLink<CR>", desc = "ObsidianLink" },
			{ "<leader>of", ":ObsidianFollowLink<CR>", desc = "ObsidianFollowLink" },
			{ "<leader>oi", ":ObsidianTemplate<CR>", desc = "ObsidianTemplate" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"preservim/vim-markdown",
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
