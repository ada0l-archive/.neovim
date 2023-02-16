local function superprint()
  vim.cmd("bufdo setlocal filetype=python")
end

vim.cmd [[
  command! AnacondaInBrowser lua superprint()
]]
