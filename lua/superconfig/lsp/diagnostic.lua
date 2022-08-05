vim.diagnostic.config({
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = config.border,
    focusable = false,
    header = { icons.debug .. ' Diagnostics:', 'Normal' },
    source = 'always',
  },
  virtual_text = {
    spacing = 4,
    source = 'always',
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
})
