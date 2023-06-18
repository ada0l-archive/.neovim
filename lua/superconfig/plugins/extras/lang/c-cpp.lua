return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        clangd = {
          settings = {
            cmd = {
              "clangd",
              "--background-index",
            },
          },
        },
      },
    },
  },
}
