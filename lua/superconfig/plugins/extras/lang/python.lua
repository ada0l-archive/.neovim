return {
  { "Vimjas/vim-python-pep8-indent", ft = "python" },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
                completeFunctionParens = true,
              },
            },
          },
          before_init = function(_, config)
            config.settings.python.pythonPath = require("superconfig.core.utils").get_python_venv()
          end,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      { "mfussenegger/nvim-dap-python" },
    },
    opts = function()
      require("dap-python").setup(
        "~/tools/debugpy/bin/python",
        { pythonPath = require("superconfig.core.utils").get_python_venv() }
      )
    end,
  },
}
