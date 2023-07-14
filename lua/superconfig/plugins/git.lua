return {
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    cmd = { "LazyGit" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>hh", ":LazyGit<CR>", desc = "LazyGit" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    opts = function()
      return {
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, "Next Hunk")

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, "Prev Hunk")

          -- stylua: ignore start
          map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
          map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
          map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
          map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
          map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
          map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        end,
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        yadm = {
          enable = false,
        },
      }
    end,
  },
}
