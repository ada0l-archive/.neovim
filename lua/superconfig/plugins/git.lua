return {
  {
    'tpope/vim-fugitive',
    cmd = 'Git'
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = function ()
      local wk = require("which-key")
      return {
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          interval = 1000,
          follow_files = true
        },
        on_attach                    = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          wk.register({
            h = {
              name = "Git hunk",
              s = { ":Gitsigns stage_hunk<CR>", "Stage hunk" },
              r = { ":Gitsigns reset_hunk<CR>", "Reset hunk" },
              p = { ":Gitsigns preview_hunk<CR>", "Preview hunk" },
              u = { ":Gitsigns undo_stage_hunk<CR>", "Undo stage hunk" },
            }
          }, { prefix = "<leader>" })

          wk.register({
            h = {
              name = "Git buffer",
              S = { ":Gitsigns state_buffer<CR>", "Stage buffer" },
              R = { ":Gitsigns reset_buffer<CR>", "Reset buffer" },
            }
          }, { prefix = "<leader>" })

          wk.register({
            h = {
              name = "Git blame",
              b = { ":Gitsigns blame_line<CR>", "Blame line" },
            }
          }, { prefix = "<leader>" })


          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
        attach_to_untracked          = true,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000,
        preview_config               = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        yadm                         = {
          enable = false
        },
      }
    end
  }
}
