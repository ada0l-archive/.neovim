return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "ahmedkhalf/project.nvim",
      "j-hui/fidget.nvim",
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("neodev").setup()
      require("fidget").setup({ window = { blend = 0 } })

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
      -- show code of diagnostic
      local function fmt(diagnostic)
        if diagnostic.code then
          return ("[%s] %s"):format(diagnostic.code, diagnostic.message)
        end
        return diagnostic.message
      end

      vim.diagnostic.config({
        virtual_text = {
          source = "always",
          format = fmt,
        },
        float = {
          source = "always",
          format = fmt,
        },
      })

      local on_attach = require("superconfig.core.lsp_on_attach")

      local servers = opts.servers

      local function setup_server(server)
        local server_opts = servers[server] or {}
        server_opts.on_attach = on_attach
        require("lspconfig")[server].setup(server_opts)
      end
      for server, _ in pairs(servers) do
        setup_server(server)
      end
    end,
    opts = {
      servers = {
        gopls = {},
        sqlls = {},
        csharp_ls = {},
        clangd = {
          settings = {
            cmd = {
              "clangd",
              "--background-index",
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              --before_init = require('neodev.lsp').before_init,
              root_dir = vim.fn.getcwd(),
              settings = { Lua = {} },
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
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
          },
        },
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
        cssls = {},
        emmet_ls = {},
        volar = {
          init_options = {
            typescript = {
              tsdk = "/usr/local/lib/node_modules/typescript/lib",
            },
          },
          filetypes = { "vue" },
        },
        tsserver = {
          settings = {
            diagnostics = { ignoredCodes = { 7044 } },
            filetypes = {
              "javascript",
              "javascriptreact",
              "javascript.jsx",
              "typescript",
              "typescriptreact",
              "typescript.tsx",
            },
          },
        },
      },
    },
  },
}
