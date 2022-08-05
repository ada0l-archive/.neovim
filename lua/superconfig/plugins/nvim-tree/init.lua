-- Autoclose nvim is nvim-tree is only buffer open
vim.api.nvim_create_autocmd('BufEnter', {
  command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
  nested = true,
})

require('nvim-tree').setup({
  view = {
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  filters = {
    custom = {
      ".git",
      "node_modules",
      ".cache",
      "__pycache__",
    },
  }
})
