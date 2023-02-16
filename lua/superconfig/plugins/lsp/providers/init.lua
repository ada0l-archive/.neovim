local M = {
  require('superconfig.plugins.lsp.providers.gopls'),
  require('superconfig.plugins.lsp.providers.pyright'),
  require('superconfig.plugins.lsp.providers.lua_ls'),
  require('superconfig.plugins.lsp.providers.tsserver'),
  --require('superconfig.plugins.lsp.providers.sqlls'),
  require('superconfig.plugins.lsp.providers.emmet'),
  require('superconfig.plugins.lsp.providers.clangd')
}

return M
