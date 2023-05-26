return {
  {
    'kylechui/nvim-surround',
    config = function ()
      require("nvim-surround").setup({})
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup()
    end,
    event = 'BufWinEnter',
  },
  {
    "jiangmiao/auto-pairs",
  },
  {
    "gpanders/editorconfig.nvim",
  },
  { 'Vimjas/vim-python-pep8-indent' },
  { 'jason0x43/vim-js-indent',      ft = 'javascript' },
  { 'bitfyre/vim-indent-html',      ft = 'html' },
}
