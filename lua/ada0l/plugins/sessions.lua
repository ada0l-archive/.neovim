return {
  {
    'echasnovski/mini.sessions',
    version = '*',
    keys = {
      {
        '<leader>\\w',
        function()
          vim.ui.input({ prompt = 'Write session name: ' }, function(input)
            MiniSessions.write(input)
          end)
          MiniSessions.get_latest()
        end,
        desc = 'Session write',
      },
      { '<leader>\\s', ':lua MiniSessions.select()<CR>', desc = 'Session write' },
      { '<leader>\\S', ':lua MiniSessions.', desc = 'Session' },
    },
    opts = {
      directory = '~/.nvim-sessions/',
    },
  },
}
