return {
  { 'Vimjas/vim-python-pep8-indent', ft = 'python' },
  {
    'neovim/nvim-lspconfig',
    optional = true,
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = 'off',
                useLibraryCodeForTypes = true,
                completeFunctionParens = true,
              },
            },
          },
          before_init = function(_, config)
            config.settings.python.pythonPath = require('ada0l.utils').get_python_venv({ force = false })
          end,
        },
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      { 'mfussenegger/nvim-dap-python' },
    },
    opts = function()
      require('dap-python').setup(
        '~/tools/debugpy/bin/python',
        { pythonPath = require('ada0l.utils').get_python_venv({ force = false }) }
      )
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'python' })
      end
    end,
  },
}
