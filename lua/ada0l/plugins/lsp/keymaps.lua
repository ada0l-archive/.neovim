local M = {}

function M.on_attach(client, buffer)
  local keymaps = {
    {
      lhs = ']d',
      rhs = vim.diagnostic.goto_next,
      opts = { desc = 'Next Diagnostic' },
    },
    {
      lhs = '[d',
      rhs = vim.diagnostic.goto_prev,
      opts = { desc = 'Prev Diagnostic' },
    },
    {
      lhs = ']e',
      rhs = function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      opts = { desc = 'Next Diagnostic' },
    },
    {
      lhs = '[e',
      rhs = function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      opts = { desc = 'Prev Diagnostic' },
    },
    {
      lhs = '<leader>e',
      rhs = vim.diagnostic.setloclist,
      opts = { desc = 'Diagnostic list' },
    },
    {
      lhs = '<leader>E',
      rhs = function()
        vim.diagnostic.setloclist({ severity = vim.diagnostic.severity.ERROR })
      end,
      opts = { desc = 'Diagnostic list' },
    },
    {
      lhs = 'K',
      rhs = vim.lsp.buf.hover,
      opts = { desc = 'Signature Help' },
      has = 'signatureHelp',
    },
    {
      lhs = '<leader>a',
      rhs = vim.lsp.buf.code_action,
      opts = { desc = 'Code Action' },
      has = 'codeAction',
    },
    {
      lhs = '<leader>r',
      rhs = vim.lsp.buf.rename,
      opts = { desc = 'Rename' },
      has = 'rename',
    },
    {
      lhs = 'gi',
      rhs = vim.lsp.buf.implementation,
      opts = { desc = 'Implementation' },
    },
    {
      lhs = 'gd',
      rhs = vim.lsp.buf.definition,
      opts = { desc = 'Goto Definition' },
      has = 'definition',
    },
    {
      lhs = 'gD',
      rhs = vim.lsp.buf.declaration,
      opts = { desc = 'Goto Declaration' },
    },
    {
      lhs = '=',
      rhs = function()
        print('formatting with ' .. client.name)
        vim.lsp.buf.format({ async = true })
      end,
      opts = { desc = 'Format' },
      has = 'documentFormatting',
    },
  }
  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. 'Provider'] then
      if keys.has == 'documentFormatting' and vim.tbl_contains({ 'volar', 'tsserver' }, client.name) then
        goto continue
      end
      local opts = {}
      opts.buffer = buffer
      opts = vim.tbl_deep_extend('force', opts, keys.opts)
      vim.keymap.set('n', keys.lhs, keys.rhs, opts)
    end
    ::continue::
  end
end

return M
