local on_attach = function(client, bufnr)
  local capabilities = client.server_capabilities
  local opts_ = { noremap = true, silent = true }
  local wk = require("which-key")
  local map = require("superconfig.core.utils").map

  local map_dict = {}

  map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts_)
  map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts_)

  map("n", "[e", function()
    require("lspsaga.diagnostic"):goto_prev({
      severity = vim.diagnostic.severity.ERROR
    })
  end, opts_)
  map("n", "]e", function()
    require("lspsaga.diagnostic"):goto_next({
      severity = vim.diagnostic.severity.ERROR
    })
  end, opts_)

  map_dict["e"] = {
    ":Lspsaga show_buf_diagnostics<CR>",
    "Diagnostic list",
  }

  map_dict["E"] = {
    ":Lspsaga show_workspace_diagnostics<CR>",
    "Diagnostic list",
  }

  if capabilities.codeActionProvider then
    map_dict["a"] = {
      ":Lspsaga code_action<CR>",
      "Code action",
    }
  end

  if capabilities.declarationProvider then
    map_dict["gD"] = {
      ":lua vim.lsp.buf.declaration()<CR>",
      "Declaration",
    }
  end

  if capabilities.definitionProvider then
    map_dict["gd"] = {
      ":Lspsaga goto_definition<CR>",
      "Definition",
    }
  end

  if capabilities.hoverProvider then
    map_dict["k"] = {
      ":Lspsaga hover_doc<CR>",
      "Hover",
    }
  end

  if capabilities.implementationProvider then
    map_dict["gi"] = {
      ":lua vim.lsp.buf.implementation()<CR>",
      "Implementation",
    }
  end

  if capabilities.renameProvider then
    map_dict["r"] = {
      ":Lspsaga rename<CR>",
      "Rename",
    }
  end

  if capabilities.referencesProvider then
    map_dict["gp"] = {
      ":Lspsaga lsp_finder<CR>",
      "Rename",
    }
  end

  if client.name == "volar" or client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  if capabilities.documentFormattingProvider then
    map_dict["="] = {
      ":lua vim.lsp.buf.format { async = true }<CR>",
      "format",
    }
  end

  wk.register(map_dict, { prefix = "<leader>" })
end

return on_attach
