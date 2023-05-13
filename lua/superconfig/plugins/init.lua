local cmd = vim.cmd
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

cmd [[
augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end
]]

require('packer').startup(function(use)
  use({
    'wbthomason/packer.nvim',
  })

  -- nice look
  -- use({
  --   'ellisonleao/gruvbox.nvim',
  --   config = function()
  --     require('superconfig.plugins.gruvbox')
  --   end,
  -- })
  use({
    'svrana/neosolarized.nvim',
    requires = {
      "tjdevries/colorbuddy.nvim"
    },
    config = function()
      require("superconfig.plugins.neosolarized")
    end
  })

  -- vs code like, position indicator
  use {
    "utilyre/barbecue.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "kyazdani42/nvim-web-devicons", -- optional
    },
    config = function()
      require("barbecue").setup()
    end,
  }

  use({
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    config = function()
      require('superconfig.plugins.lualine')
    end,
  })

  --git
  use({
    'tpope/vim-fugitive',
    opt = true,
    cmd = 'Git'
  })

  -- git column signs
  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    after = {
      'which-key.nvim'
    },
    config = function()
      require('superconfig.plugins.gitsigns')
    end,
  })

  -- filemanager
  use({
    'nvim-neo-tree/neo-tree.nvim',
    tag = "2.59",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    after = {
      'which-key.nvim'
    },
    config = function()
      require('superconfig.plugins.neo-tree')
    end
  })

  -- comments
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    event = 'BufWinEnter',
  })

  -- search
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      {
        'ahmedkhalf/project.nvim',
        config = function()
          require("superconfig.plugins.project")
        end
      }
    },
    tag = 'nvim-0.6',
    after = {
      'which-key.nvim'
    },
    config = function()
      require('telescope').load_extension('projects')
      require('superconfig.plugins.telescope')
    end,
  })

  -- focus
  use({
    'beauwilliams/focus.nvim',
    config = function()
      require('superconfig.plugins.focus')
    end,
    event = 'BufWinEnter',
  })

  -- lsp
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require("neodev").setup({
        library = {
          plugins = false, -- installed opt or start plugins in packpath
        },
        override = function(_, library)
          library.enabled = true
          library.plugins = { 'nvim-treesitter' }
        end,
      })
      require('superconfig.plugins.lsp')
    end,
    after = {
      "mason.nvim"
    },
    requires = {
      {
        'folke/neodev.nvim',
      },
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup()
        end
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup()
        end
      },
      {
        "ahmedkhalf/project.nvim",
      },
      event = 'BufWinEnter',
    }
  })

  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('superconfig.plugins.null_ls')
    end,
    after = 'nvim-lspconfig',
  })

  -- lsp-cmp
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('superconfig.plugins.nvim-cmp')
    end,
    requires = {
      { 'hrsh7th/cmp-nvim-lsp',                after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer',                  after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path',                    after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline',                 after = 'nvim-cmp' },
      { 'hrsh7th/cmp-vsnip',                   after = 'nvim-cmp' },
      { 'hrsh7th/vim-vsnip',                   after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'rafamadriz/friendly-snippets',        after = 'nvim-cmp' },
      { 'onsails/lspkind.nvim' }
    },
  })

  -- dap
  -- use {
  --   "rcarriga/nvim-dap-ui",
  --   requires = {
  --     "mfussenegger/nvim-dap",
  --   },
  --   config = function()
  --     require('superconfig.plugins.dap')
  --   end,
  -- }

  -- use {
  --   "theHamsta/nvim-dap-virtual-text",
  --   requires = {
  --     "mfussenegger/nvim-dap",
  --   },
  --   config = function()
  --     require('superconfig.plugins.dap-virtual-text')
  --   end,
  -- }

  -- lang/syntax stuff
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    tag = 'v0.9.0',
    config = function()
      require('superconfig.plugins.treesitter')
    end
  })

  -- tags
  use({
    'liuchengxu/vista.vim',
    config = function()
      require('superconfig.plugins.vista')
    end,
    after = 'nvim-lspconfig'
  })

  -- fast motion
  use({
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require('superconfig.plugins.hop')
    end
  })

  -- mapping
  use({
    'folke/which-key.nvim',
    config = function()
      require("superconfig.plugins.which-key")
    end
  })

  use({
    'kylechui/nvim-surround',
    config = function()
      require("nvim-surround").setup({})
    end
  })

  -- python
  use({ 'Vimjas/vim-python-pep8-indent' })
  -- javascript
  use({ 'jason0x43/vim-js-indent', ft = 'javascript' })
  -- html
  use({ 'bitfyre/vim-indent-html', ft = 'html' })
end)
