local servers = require('superconfig.lsp.providers')
local merge = require('superconfig.utils').merge
local default = require('superconfig.lsp.default')
local lspconfig = require('lspconfig')

vim.diagnostic.config(require('superconfig.lsp.diagnostic'))

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

-- tabnew after goto definition
vim.lsp.handlers["textDocument/definition"] = goto_definition('tabnew')

function get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- Code actions
  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
          table.sort(res)
          return res
        end)(),
      },
    },
  }

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities.experimental = {}
  capabilities.experimental.hoverActions = true
  return capabilities
end

for _, server in ipairs(servers) do
  local args = merge(get_capabilities(), server.settings)
  args = merge(args, default)
  lspconfig[server.name].setup(args)
end
