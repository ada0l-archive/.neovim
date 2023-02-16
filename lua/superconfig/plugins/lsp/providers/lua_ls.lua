local M = {
  name = 'lua_ls',
  settings = {
    Lua = {
      before_init = require("neodev.lsp").before_init,
      root_dir = vim.fn.getcwd(),
      settings = { Lua = {} },
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          ["/usr/share/nvim/runtime/lua"] = true,
          ["/usr/share/nvim/runtime/lua/vim"] = true,
          ["/usr/share/nvim/runtime/lua/vim/lsp"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  }
}

return M
