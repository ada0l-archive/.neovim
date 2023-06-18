local M = {}

function M.on_attach(client, buffer)
  local keymaps = {
    {
      "]d",
      vim.diagnostic.goto_next,
      desc = "Next Diagnostic"
    },
    {
      "[d",
      vim.diagnostic.goto_prev,
      desc = "Prev Diagnostic"
    },
    {
      "<leader>k",
      vim.lsp.buf.hover,
      desc = "Signature Help",
      has = "signatureHelp"
    },
    {
      "<leader>a",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      has = "codeAction"
    },
    {
      "<leader>r",
      vim.lsp.buf.rename,
      desc = "Rename",
      has = "rename"
    },
    {
      "<leader>gi",
      vim.lsp.buf.implementation,
      desc = "Implementation",
    },
    {
      "<leader>gd",
      vim.lsp.buf.definition,
      desc = "Goto Definition",
      has = "definition"
    },
    {
      "<leader>gD",
      vim.lsp.buf.declaration,
      desc = "Goto Declaration"
    },
    {
      "<leader>=",
      function() vim.lsp.buf.format({ async = true }) end,
      desc = "Format",
      has = "documentFormatting"
    }
  }
  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
      local opts = {}
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
    end
  end
end

return M
