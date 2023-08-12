return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
          local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')
          vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
          vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)
        end,
      },
      {
        'nvim-treesitter/playground',
        cmd = { 'TSPlaygroundToggle' },
      },
    },
    --tag = 'v0.9.0',
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'vv',
          node_incremental = '+',
          node_decremental = '-',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',

            ['ak'] = '@class.outer',
            ['ik'] = '@class.inner',

            ['ac'] = '@call.outer',
            ['ic'] = '@call.inner',

            ['a,'] = '@parameter.outer',
            ['i,'] = '@parameter.inner',

            ['al'] = '@assignment.lhs',
            ['ar'] = '@assignment.rhs',

            ['ai'] = '@return.outer',
            ['ii'] = '@return.inner',

            ['ab'] = '@block.outer',
            ['ib'] = '@block.inner',

            ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ['],'] = '@parameter.inner',
          },
          goto_previous_start = {
            ['[,'] = '@parameter.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['>,'] = '@parameter.inner',
          },
          swap_previous = {
            ['<,'] = '@parameter.inner',
          },
        },
      },
      ensure_installed = {},
      compilers = { 'clang' },
      install = {
        prefer_git = false,
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
