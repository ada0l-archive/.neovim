local path = require('lspconfig/util').path

local M = {
  name = 'pyright',
  settings = {
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
      config.settings.python.pythonPath = require('superconfig.utils').get_python_venv()
    end,
  }
}

return M
