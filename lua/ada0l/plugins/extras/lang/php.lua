return {
  {
    'neovim/nvim-lspconfig',
    optional = true,
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              stubs = {
                'Core',
                'SPL',
                'imagick',
                'standard',
                'pcre',
                'date',
                'json',
                'ctype',
                'SimpleXML',
                'Reflection',
                'mysqli',
              },
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
        vim.list_extend(opts.ensure_installed, {
          'php',
          'phpdoc',
        })
      end
    end,
  },
}
