local null_ls = require('null-ls')

null_ls.setup({
  autostart = true,
  on_attach = require('superconfig.plugins.lsp.attach'),
  sources = {
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black.with({
      extra_args = {
        "--line-length=79"
      }
    }),
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = {
        "--ignore-missing-imports"
      }
    }),
    null_ls.builtins.diagnostics.eslint,
  },
})
