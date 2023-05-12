local M = {
  {
    name = 'gopls',
    settings = {}
  },
  {
    name = 'sqlls',
    settings = {}
  },
  {
    name = 'clangd',
    settings = {
      cmd = {
        "clangd",
        "--background-index",
      }
    }
  },
  {
    name = 'lua_ls',
    settings = {
      Lua = {
        before_init = require("neodev.lsp").before_init,
        root_dir = vim.fn.getcwd(),
        settings = { Lua = {} },
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = {
            ["/usr/share/nvim/runtime/lua"] = true,
            ["/usr/share/nvim/runtime/lua/vim"] = true,
            ["/usr/share/nvim/runtime/lua/vim/lsp"] = true,
          },
        },
        telemetry = {
          enable = false,
        },
      },
    }
  },
  {
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
  },
  -- VUE
  {
    name = 'cssls',
    settings = {}
  },
  {
    name = 'emmet_ls',
    settings = {}
  },
  {
    name = 'volar',
    settings = {
      vetur = {
        format = {
          enable = false
        }
      },
      init_options = {
        typescript = {
          tsdk = '/usr/local/lib/node_modules/typescript/lib'
        },
      },
      filetypes = { 'vue', }
    }
  },
  {
    name = "tsserver",
    settings = {
      filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"
      }
    }
  }
}

return M
