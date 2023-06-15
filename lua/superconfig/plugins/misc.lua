return {
  {
    "andweeb/presence.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
    event = "VeryLazy",
    priority = 10000,
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
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TestNvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
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
