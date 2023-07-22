return {
  {
    'neovim/nvim-lspconfig',
    optional = true,
    opts = {
      servers = {
        clangd = {
          settings = {
            cmd = {
              'clangd',
              '--background-index',
            },
          },
        },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'c', 'cpp' })
      end
    end,
  },
}
