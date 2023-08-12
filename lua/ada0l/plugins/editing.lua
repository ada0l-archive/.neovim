return {
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
    keys = {
      { "ms", mode = { 'x', 'v', 'n' }, desc = "[Match] Surround add" },
      { "md", mode = { 'n', 'x', 'v' }, desc = "[Match] Surround delete" },
      { "mr", mode = { 'n' },           desc = "[Match] Surround replace" },
      { "mf", mode = { 'n' },           desc = "[Match] Surround find" },
    },
    opts = {
      mappings = {
        add = 'ms',
        delete = 'md',
        replace = 'mr',
        find = 'mf',
      },
      search_method = 'cover_or_next',
    },
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    lazy = true,
    keys = { { 'gS', desc = "[Splitjoin] toggle" } },
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
    keys = {
      { '<c-c>', desc = "[Comment] toggle" }
    },
    opts = {
      mappings = {
        comment = '<c-c>',
        comment_line = '<c-c>',
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
        desc = '[Spectre] Open',
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
        desc = '[Yanky] Open Yank History',
      },
      {
        'y',
        '<Plug>(YankyYank)',
        mode = { 'n', 'x' },
        desc = '[Yanky] Yank text',
      },
      {
        'p',
        '<Plug>(YankyPutAfter)',
        mode = { 'n', 'x' },
        desc = '[Yanky] Put yanked text after cursor',
      },
      {
        'P',
        '<Plug>(YankyPutBefore)',
        mode = { 'n', 'x' },
        desc = '[Yanky] Put yanked text before cursor',
      },
      {
        'gp',
        '<Plug>(YankyGPutAfter)',
        mode = { 'n', 'x' },
        desc = '[Yanky] Put yanked text after selection',
      },
      {
        'gP',
        '<Plug>(YankyGPutBefore)',
        mode = { 'n', 'x' },
        desc = '[Yanky] Put yanked text before selection',
      },
      {
        '[y',
        '<Plug>(YankyCycleForward)',
        desc = '[Yanky] Cycle forward through yank history',
      },
      {
        ']y',
        '<Plug>(YankyCycleBackward)',
        desc = '[Yanky] Cycle backward through yank history',
      },
    },
  },
  {
    'echasnovski/mini.doc',
    version = '*',
    opts = {},
    keys = {
      {
        "<leader>D",
        "<cmd>lua require('mini.doc').generate()<cr>",
        desc = "[Mini.Doc] Generate vim doc"
      }
    }
  },
}
