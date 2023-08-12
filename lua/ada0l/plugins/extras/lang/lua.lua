return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'lua', 'luadoc', 'luap' })
      end
    end,
  },
  {
    'neovim/nvim-lspconfig',
    optional = true,
    dependencies = {
      { 'folke/neodev.nvim', opts = {} },
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
            },
          },
        },
      },
    },
  },
}
