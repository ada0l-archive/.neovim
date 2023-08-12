return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        keys = {
          { '<leader>gx', ":lua require('dapui').toggle()<CR>", desc = '[DAP] Close UI' },
        },
        opts = {
          layouts = {
            {
              elements = {
                { id = 'scopes', size = 0.25 },
                'breakpoints',
                'stacks',
                'watches',
              },
              size = 40, -- 40 columns
              position = 'right',
            },
            {
              elements = {
                'repl',
                'console',
              },
              size = 0.25, -- 25% of total lines
              position = 'bottom',
            },
          },
        },
      },
    },
    keys = {
      { '<leader>gb', ':DapToggleBreakpoint<CR>', desc = '[DAP] Toggle Breakpoint' },
      { '<leader>gc', ':DapContinue<CR>',         desc = '[DAP] Continue DAP' },
    },
    opts = {},
    config = function() end,
  },
}
