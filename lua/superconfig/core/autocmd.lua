vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp,lua,json,javascript,typescript,vue",
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "set wrap linebreak",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "setlocal noexpandtab",
})

if vim.g.ada0l_trim_trailing_disabled == nil then
  local function trim_trailing_whitespace()
    local view = vim.fn.winsaveview()
    vim.api.nvim_command("silent! undojoin")
    vim.api.nvim_command("silent keepjumps keeppatterns %s/\\s\\+$//e")
    return vim.fn.winrestview(view)
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = trim_trailing_whitespace,
  })
end

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]])
