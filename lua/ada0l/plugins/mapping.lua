return {
  {
    'Wansmer/langmapper.nvim',
    lazy = false,
    enabled = false,
    priority = 1, -- High priority is needed if you will use `autoremap()`
    opts = {},
    config = function(_, opts)
      require('langmapper').setup(opts)
      require('langmapper').hack_get_keymap()
    end,
  },
  {
    'folke/which-key.nvim',
    enabled = true,
    keys = { '<leader>', '[', ']', 's', 'g' },
    opts = {},
  },
}
