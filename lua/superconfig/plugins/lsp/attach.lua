local map = require('superconfig.utils').map
local function on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local capabilities = client.server_capabilities
  local opts = { noremap = true, silent = true }

  map('n', '<space>e', vim.diagnostic.open_float, opts)
  map('n', '[d', vim.diagnostic.goto_prev, opts)
  map('n', ']d', vim.diagnostic.goto_next, opts)
  map('n', '<space>q', vim.diagnostic.setloclist, opts)

  if capabilities.codeActionProvider then
    map('n', '<space>ca', vim.lsp.buf.code_action, opts)
  end

  if capabilities.declarationProvider then
    map('n', 'gD', vim.lsp.buf.declaration, opts)
  end

  if capabilities.definitionProvider then
    map('n', 'gd', vim.lsp.buf.definition, opts)
  end

  if capabilities.hoverProvider then
    map('n', 'K', vim.lsp.buf.hover, opts)
  end

  if capabilities.implementationProvider then
    map('n', 'gi', vim.lsp.buf.implementation, opts)
  end

  if capabilities.signatureHelpProvider then
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  end

  if capabilities.typeDefinitionProvider then
    map('n', '<space>D', vim.lsp.buf.type_definition, opts)
  end

  if capabilities.renameProvider then
    map('n', '<space>rn', vim.lsp.buf.rename, opts)
  end


  if capabilities.referencesProvider then
    map('n', 'gr', vim.lsp.buf.references, opts)
  end

  if capabilities.documentFormattingProvider then
    map('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
  end
end
return on_attach
