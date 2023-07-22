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
        function ()
          require('mini.files').open(vim.api.nvim_buf_get_name(0))
        end,
        desc = 'Files Toggle',
      }
    },
    opts = {
      mappings = {
        close = 'q',
        go_in = '<nop>',
        go_in_plus = '<cr>',
        go_out = '<nop>',
        go_out_plus = '<bs>',
        reset = '<c-BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
    },
  },
  {
    'echasnovski/mini.jump',
    opts = {},
  },
  {
    'echasnovski/mini.jump2d',
    version = '*',
    lazy = true,
    keys = { '<CR>' },
    opts = {
      mappings = {
        start_jumping = '<CR>',
      },
      silent = false,
      view = {
        dim = true,
      },
    },
    init = function()
      vim.cmd([[autocmd Filetype qf lua vim.b.minijump2d_disable = true]])
      vim.cmd([[autocmd Filetype minifiles lua vim.b.minijump2d_disable = true]])
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
      { 'nvim-telescope/telescope-symbols.nvim' },
      {
        'ahmedkhalf/project.nvim',
        event = 'VeryLazy',
        cmd = 'Telescope projects',
        keys = {
          { '<leader>sp', ':Telescope projects<CR>', desc = 'Search project' },
        },
        opts = {},
        config = function(_, opts)
          require('project_nvim').setup(opts)
          require('telescope').load_extension('projects')
        end,
      },
    },
    keys = {
      { '<leader>S', ':Telescope<CR>', desc = 'Search by Telescope' },
      { '<leader>sf', ':Telescope find_files<CR>', desc = 'Search files' },
      { '<leader>sg', ':Telescope live_grep<CR>', desc = 'Search by live grep' },
      { '<leader>sb', ':Telescope buffers<CR>', desc = 'Search buffer' },
      { "<leader>'", ':Telescope resume<CR>', desc = 'Resume Picker' },
      { '<leader>ss', ':Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Search symbol' },
      { '<leader>sS', ':Telescope lsp_document_symbols<CR>', desc = 'Search symbol in workspace' },
    },
    tag = '0.1.1',
    config = function(_, opts)
      require('telescope').setup(opts)
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
    'folke/which-key.nvim',
    keys = { '<leader>', '[', ']', 's' },
    opts = {},
  },
}
