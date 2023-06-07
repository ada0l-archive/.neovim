return {
  {
    "andweeb/presence.nvim",
    opts = {
      auto_update         = true,
      neovim_image_text   = "The One True Text Editor",
      main_image          = "neovim",
      log_level           = nil,
      debounce_timeout    = 10,
      enable_line_number  = false,
      blacklist           = {
        "/home/ada0l/Documents/SyncObsidian/*"
      },
      buttons             = true,
      file_assets         = {},
      show_time           = true,

      editing_text        = "Editing %s",
      file_explorer_text  = "Browsing %s",
      git_commit_text     = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text        = "Reading %s",
      workspace_text      = "Working on %s",
      line_number_text    = "Line %s out of %s",
    }
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    event = "BufWinEnter",
  },
  {
    "windwp/nvim-autopairs",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    event = "InsertEnter",
  },
  {
    "hkupty/nvimux",
    config = function()
      local nvimux = require('nvimux')
      nvimux.setup {
        config = {
          prefix = '<C-a>',
        },
        bindings = {
          { { 'n', 'v', 'i', 't' }, 's', nvimux.commands.horizontal_split },
          { { 'n', 'v', 'i', 't' }, 'v', nvimux.commands.vertical_split },
        }
      }
    end
  },
  {
    "gpanders/editorconfig.nvim",
  },
  { "Vimjas/vim-python-pep8-indent",                        ft = "python" },
  { "jason0x43/vim-js-indent",                              ft = "javascript" },
  { "bitfyre/vim-indent-html",                              ft = "html" },
  { "captbaritone/better-indent-support-for-php-with-html", ft = "php" }
}
