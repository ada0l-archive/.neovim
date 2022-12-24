local M = {}

function M.on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('superconfig.lsp.mapping').init(client, bufnr)
end

M.flags = { debounce_text_changes = 150, }
M.autostart = true
M.single_file_support = true

return M
