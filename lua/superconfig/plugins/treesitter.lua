return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    build = ":TSUpdate",
    --tag = 'v0.9.0',
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "rust",
        "bash",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "markdown",
        "prisma",
        "python",
        "scss",
        "vim",
        "sql",
      },
      compilers = { "clang" },
      install = {
        prefer_git = false,
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
