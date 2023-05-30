return {
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    event = "BufWinEnter",
  },
  {
    "windwp/nvim-autopairs",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    event = "InsertEnter",
  },
  {
    "gpanders/editorconfig.nvim",
  },
  { "Vimjas/vim-python-pep8-indent", ft = "python" },
  { "jason0x43/vim-js-indent",       ft = "javascript" },
  { "bitfyre/vim-indent-html",       ft = "html" },
}
