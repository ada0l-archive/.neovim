return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    dependencies = {
      { "nvim-lua/plenary.nvim",       lazy = true },
      { "jay-babu/mason-null-ls.nvim", }
    },
    config = function(_, opts)
      local null_ls = require("null-ls")
      null_ls.setup({
        on_attach = require("superconfig.core.lsp_on_attach")
      })
      local mason_null_ls = require("mason-null-ls")
      mason_null_ls.setup({
        ensure_installed = { 'isort', 'black', 'stylua', 'mypy', 'prettier' },
        automatic_installation = true,
        handlers = {
          black = function(source_name, methods)
            null_ls.register(null_ls.builtins.formatting.black.with({
              extra_args = {
                "--line-length=79",
              },
            }))
          end,
          stylua = function(source_name, methods)
            null_ls.register(null_ls.builtins.formatting.stylua.with({
              extra_args = {
                "--indent-type Spaces",
                "--indent-widht 2",
              },
            }))
          end,
          mypy = function(source_name, methods)
            null_ls.register(
              null_ls.builtins.diagnostics.mypy.with({
                extra_args = {
                  "--ignore-missing-imports",
                },
              })
            )
          end
        }
      })
    end,
  },
}
