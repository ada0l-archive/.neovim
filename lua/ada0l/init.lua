require('ada0l.options')
require('ada0l.mapping')
require('ada0l.lazy')

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Translate global keybindings',
  callback = function()
    local ok, lm = pcall(require, 'langmapper')
    if ok then
      lm.automapping({ buffer = false })
    end
  end,
})
