return {
  {
    "echasnovski/mini.sessions",
    version = "*",
    keys = {
      { "<leader><leader>w", ':lua MiniSessions.write"', desc = "Session write" },
      { "<leader><leader>s", ":lua MiniSessions.select()<CR>", desc = "Session write" },
      { "<leader><leader>S", ":lua MiniSessions.", desc = "Session" },
    },
    opts = {
      directory = "~/.nvim-sessions/",
    },
  },
}
