local lspconfig = require('lspconfig')
local servers = require('superconfig.plugins.lsp.providers')
local merge = require('superconfig.utils').merge
local goto_definition = require('superconfig.plugins.lsp.goto_definition')

vim.lsp.handlers["textDocument/definition"] = goto_definition('tabnew')
vim.diagnostic.config(require('superconfig.plugins.lsp.diagnostic'))

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded"
  }
)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

for _, server in ipairs(servers) do
  local default_settings = {
    on_attach = require('superconfig.plugins.lsp.attach'),
    flags = {
      debounce_text_changes = 150,
    }
  }
  local settings = merge(default_settings, server.settings)
  lspconfig[server.name].setup(settings)
end
