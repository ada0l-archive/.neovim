return {
  {
    'echasnovski/mini.files',
    keys = {
      {
        '<leader>n',
        function()
          require('mini.files').open()
        end,
        desc = 'Files Toggle',
      },
      {
        '<leader>N',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0))
        end,
        desc = 'Files Toggle',
      },
    },
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 70,
      }
    },
  },
  {
    'echasnovski/mini.jump2d',
    version = '*',
    keys = {
      '<CR>'
    },
    opts = {
      mappings = {
        start_jumping = '<CR>',
      },
      labels = 'asdfghjkl;',
      silent = false,
      view = {
        dim = false,
      },
      allowed_windows = {
        current = true,
        not_current = false,
      },
    },
    config = function(_, opts)
      vim.cmd([[au FileType * if index(['qf', 'minifiles'], &ft) < 0 | let b:minicursorword_disable=v:true | endif]])
      require('mini.jump2d').setup(opts)
    end,
  },
  {
    'ahmedkhalf/project.nvim',
    cmd = 'Telescope projects',
    event = 'VeryLazy',
    keys = {
      { '<leader>\\', ':Telescope projects<CR>', desc = 'Search project' },
    },
    opts = {
      detection_methods = { 'pattern' },
      patterns = { '.git', 'Makefile', 'package.json', 'pyproject.toml' },
      silent_chdir = false,
    },
    config = function(_, opts)
      require('project_nvim').setup(opts)
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-lua/plenary.nvim',                 lazy = true },
      { 'nvim-telescope/telescope-symbols.nvim', lazy = true },
    },
    keys = {
      { '<leader>f', ':Telescope find_files<CR>',                    desc = '[Telescope] Search files' },
      { '<leader>/', ':Telescope live_grep<CR>',                     desc = '[Telescope] Search by live grep' },
      { '<leader>b', ':Telescope buffers<CR>',                       desc = '[Telescope] Search buffer' },
      { '<leader>d', ':Telescope diagnostic<CR>',                    desc = '[Telescope] Search diagnostics' },
      { "<leader>'", ':Telescope resume<CR>',                        desc = '[Telescope] Resume Picker' },
      { '<leader>S', ':Telescope lsp_dynamic_workspace_symbols<CR>', desc = '[Telescope] Search symbol' },
      { '<leader>s', ':Telescope lsp_document_symbols<CR>',          desc = '[Telescope] Search symbol in workspace' },
    },
    tag = '0.1.1',
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('projects')
    end,
    opts = function()
      local actions = require('telescope.actions')
      return {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--no-config',
            '--no-ignore',
            '--color=never',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '-g=!.git',
            '-g=!.ccls-cache',
            '-g=!node_modules',
            '-g=!lazy-lock.json',
            '-g=!venv',
            '-g=!__pycache__',
            '-g=!dist',
          },
          layout_config = {
            vertical = { width = 1 },
          },
          file_ignore_patterns = {
            'node_modules',
            'build',
            'dist',
            'yarn.lock',
            'package-lock.json',
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
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
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true, icons = false },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
      {
        "[q",
        function()
          require("trouble").previous({ skip_groups = true, jump = true })
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          require("trouble").next({ skip_groups = true, jump = true })
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  }
}
