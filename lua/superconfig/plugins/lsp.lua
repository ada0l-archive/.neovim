local function diagnostic_format(diagnostic)
  if diagnostic.code then
    return ("[%s] %s"):format(diagnostic.code, diagnostic.message)
  end
  return diagnostic.message
end

local on_attach = require("superconfig.core.lsp_on_attach")

return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "ahmedkhalf/project.nvim",
      "j-hui/fidget.nvim",
      {
        "glepnir/lspsaga.nvim",
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          -- Please make sure you install markdown and markdown_inline parser
          { "nvim-treesitter/nvim-treesitter" }
        }
      },
    },
    config = function(_, opts)
      require("neodev").setup()
      require("lspsaga").setup({
        ui = { border = "single" },
        lightbulb = {
          virtual_text = false,
        },
        finder = {
          scroll_down = "<C-f>",
          scroll_up = "<C-b>", -- quit can be a table
          quit = { "q", "<ESC>" },
        },
        symbol_in_winbar = {
          enable = false,
          show_file = false,
        },
      })
      require("fidget").setup({ window = { blend = 0 } })

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = {
          source = "always",
          format = diagnostic_format,
        },
        float = {
          source = "always",
          format = diagnostic_format,
        },
      })

      require("mason").setup()

      local servers = opts.servers
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end
      local ensure_installed = {}

      local function setup_server(server)
        local server_opts = servers[server] or {}
        server_opts.on_attach = on_attach
        require("lspconfig")[server].setup(server_opts)
      end

      for server, server_opts in pairs(servers) do
        if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
          setup_server(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup_server } })
      end
    end,
    opts = {
      servers = {
        gopls = {},
        sqlls = {},
        csharp_ls = {},
        docker_compose_language_service = {},
        dockerls = {},
        jsonls = {},
        rust_analyzer = {},
        intelephense = {
          settings = {
            intelephense = {
              -- possible values: stubs.txt
              stubs = {
                'Core',
                'SPL',
                'imagick',
                'standard',
                'pcre',
                'date',
                'json',
                'ctype',
                'SimpleXML',
                'Reflection',
                'mysqli'
              }
            }
          }
        },
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
              settings = { Lua = {} },
              runtime = {
                version = "LuaJIT",
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
