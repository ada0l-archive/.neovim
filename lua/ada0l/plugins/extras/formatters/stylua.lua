return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'stylua')
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local nls = require('null-ls')
      table.insert(
        opts.sources,
        nls.builtins.formatting.stylua.with({
          extra_args = {
            '--indent-type Spaces',
            '--indent-widht 2',
          },
        })
      )
    end,
  },
}
