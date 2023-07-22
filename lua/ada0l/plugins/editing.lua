return {
  {
    'vim-pandoc/vim-pandoc',
  },
  {
    'vim-pandoc/vim-pandoc-syntax',
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    lazy = true,
    event = { 'InsertEnter' },
    opts = {},
    init = function()
      vim.cmd([[autocmd Filetype TelescopePrompt lua vim.b.minipairs_disable = true]])
    end,
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {
      mappings = {
        add = 'sa',
        delete = 'sd',
        find = 'sf',
        find_left = 'sF',
        highlight = 'sh',
        replace = 'sr',
        update_n_lines = 'sn',
      },
    },
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    lazy = true,
    keys = { 'gS' },
    opts = {
      mappings = {
        toggle = 'gS',
        split = '',
        join = '',
      },
    },
  },
  {
    'echasnovski/mini.comment',
    version = '*',
    opts = {
      mappings = {
        comment = 'gc',
        comment_line = 'gcc',
        textobject = 'gc',
      },
    },
  },
  {
    'nvim-pack/nvim-spectre',
    keys = {
      {
        '<leader>?',
        function()
          require('spectre').open()
        end,
        desc = 'Spectre',
      },
    },
    opts = {},
  },
  {
    'gpanders/editorconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'gbprod/yanky.nvim',
    dependencies = { { 'kkharji/sqlite.lua', enabled = not jit.os:find('Windows') } },
    opts = function()
      local mapping = require('yanky.telescope.mapping')
      local mappings = mapping.get_defaults()
      mappings.i['<c-p>'] = nil
      return {
        highlight = { timer = 200 },
        ring = { storage = jit.os:find('Windows') and 'shada' or 'sqlite' },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = mappings,
          },
        },
        system_clipboard = {
          sync_with_ring = false,
        },
      }
    end,
    keys = {
      {
        '<leader>Y',
        function()
          require('telescope').extensions.yank_history.yank_history({})
        end,
        desc = 'Open Yank History',
      },
      {
        'y',
        '<Plug>(YankyYank)',
        mode = { 'n', 'x' },
        desc = 'Yank text',
      },
      {
        'p',
        '<Plug>(YankyPutAfter)',
        mode = { 'n', 'x' },
        desc = 'Put yanked text after cursor',
      },
      {
        'P',
        '<Plug>(YankyPutBefore)',
        mode = { 'n', 'x' },
        desc = 'Put yanked text before cursor',
      },
      {
        'gp',
        '<Plug>(YankyGPutAfter)',
        mode = { 'n', 'x' },
        desc = 'Put yanked text after selection',
      },
      {
        'gP',
        '<Plug>(YankyGPutBefore)',
        mode = { 'n', 'x' },
        desc = 'Put yanked text before selection',
      },
      {
        '[y',
        '<Plug>(YankyCycleForward)',
        desc = 'Cycle forward through yank history',
      },
      {
        ']y',
        '<Plug>(YankyCycleBackward)',
        desc = 'Cycle backward through yank history',
      },
    },
  },
}
