return {
  {
    'neovim/nvim-lspconfig',
    optional = true,
    opts = {
      servers = {
        docker_compose_language_service = {},
        dockerls = {},
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'dockerfile' })
      end
    end,
  },
}
