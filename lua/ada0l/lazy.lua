local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, 'lazy')
if not ok then
  return
end

lazy.setup({
  spec = {
    { import = 'ada0l.plugins' },
    { import = 'ada0l.plugins.extras.lang' },
    { import = 'ada0l.plugins.extras.diagnostic' },
    { import = 'ada0l.plugins.extras.formatters' },
  },
  install = {},
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      disabled_plugins = {
          "gzip",
          "netrwPlugin",
          "rplugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
      },
    },
  },
})

local map = require('ada0l.utils').map

map('n', '<leader>L', '<cmd>Lazy<cr>', { desc = "[Lazy] Open" })
