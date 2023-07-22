return {
  { 'bitfyre/vim-indent-html', ft = 'html' },
  {
    'neovim/nvim-lspconfig',
    optional = true,
    opts = {
      servers = {
        emmet_ls = {},
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'html', 'htmldjango' })
      end
    end,
  },
}
