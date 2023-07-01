local M = {}

function M.on_attach(client, buffer)
  local keymaps = {
    {
      "]d",
      vim.diagnostic.goto_next,
      desc = "Next Diagnostic",
    },
    {
      "[d",
      vim.diagnostic.goto_prev,
      desc = "Prev Diagnostic",
    },
    {
      "]e",
      function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      desc = "Next Diagnostic",
    },
    {
      "[e",
      function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      desc = "Prev Diagnostic",
    },
    {
      "e",
      vim.diagnostic.setloclist,
      desc = "Diagnostic list",
    },
    {
      "E",
      function()
        vim.diagnostic.setloclist({ severity = vim.diagnostic.severity.ERROR })
      end,
      desc = "Diagnostic list",
    },
    {
      "<leader>k",
      vim.lsp.buf.hover,
      desc = "Signature Help",
      has = "signatureHelp",
    },
    {
      "<leader>a",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      has = "codeAction",
    },
    {
      "<leader>r",
      vim.lsp.buf.rename,
      desc = "Rename",
      has = "rename",
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
      has = "definition",
    },
    {
      "<leader>gD",
      vim.lsp.buf.declaration,
      desc = "Goto Declaration",
    },
    {
      "<leader>=",
      function()
        print("formatting with " .. client.name)
        vim.lsp.buf.format({ async = true })
      end,
      desc = "Format",
      has = "documentFormatting",
    },
  }
  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
      if keys.has == "documentFormatting" and vim.tbl_contains({ "volar", "tsserver" }, client.name) then
        goto continue
      end
      local opts = {}
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
    end
    ::continue::
  end
end

return M
