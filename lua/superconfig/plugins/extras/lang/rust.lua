return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = {
      server = {
        ["rust-analyzer"] = {
          -- assist = {
          --   importEnforceGranularity = true,
          --   importPrefix = "crate",
          -- },
          -- cargo = {
          --   allFeatures = true,
          -- },
          -- checkOnSave = {
          --   command = "clippy",
          -- },
          -- inlayHints = { locationLinks = false },
          -- diagnostics = {
          --   enable = true,
          --   experimental = {
          --     enable = true,
          --   },
          -- },
        },
      },
    },
  },
}
