local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local function lsp(use)
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
  -- use({
  --   'mrded/nvim-lsp-notify',
  --   config = function()
  --     require('lsp-notify').setup({
  --     })
  --   end,
  -- })
  use({
    'j-hui/fidget.nvim',
    config = function()
      require "fidget".setup {}
    end
  })
end

local function debug(use)
  use {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require('superconfig.plugins.dap')
    end,
  }

  use {
    "theHamsta/nvim-dap-virtual-text",
    requires = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require('superconfig.plugins.dap-virtual-text')
    end,
  }
end

local function ui(use)
  -- nice look
  -- use({
  --   'ellisonleao/gruvbox.nvim',
  --   config = function()
  --     require('superconfig.plugins.gruvbox')
  --   end,
  -- })
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require('superconfig.plugins.catppuccin')
    end
  })
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
  use({
    "folke/zen-mode.nvim",
    config = function()
      require('superconfig.plugins.zen')
    end
  })
end

local function autocomplete(use)
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
end

local function navigation(use)
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
    cmd = { 'NeoTreeFloatToggle', 'NeoTreeShow' },
    config = function()
      require('superconfig.plugins.neo-tree')
    end
  })
  use({
    'ahmedkhalf/project.nvim',
    config = function()
      require("superconfig.plugins.project")
    end
  })
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    tag = 'nvim-0.6',
    after = {
      'which-key.nvim',
      "project.nvim"
    },
    config = function()
      require('telescope').load_extension('projects')
      require('superconfig.plugins.telescope')
    end,
  })
  -- use({
  --   'liuchengxu/vista.vim',
  --   config = function()
  --     require('superconfig.plugins.vista')
  --   end,
  --   after = 'nvim-lspconfig'
  -- })
  use({
    'stevearc/aerial.nvim',
    config = function()
      require("superconfig.plugins.aerial")
    end
  })
  use({
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('superconfig.plugins.hop')
    end
  })
end

local function git(use)
  use({
    'tpope/vim-fugitive',
    opt = true,
    cmd = 'Git'
  })
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
end

local function syntax(use)
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    tag = 'v0.9.0',
    config = function()
      require('superconfig.plugins.treesitter')
    end
  })
  use({
    'kylechui/nvim-surround',
    config = function()
      require("nvim-surround").setup({})
    end
  })
end

local function keybinding(use)
  use({
    'folke/which-key.nvim',
    config = function()
      require("superconfig.plugins.which-key")
    end
  })
end

local function split_and_window(use)
  use({
    'beauwilliams/focus.nvim',
    config = function()
      require('superconfig.plugins.focus')
    end,
    event = 'BufWinEnter',
  })
end

local function note_taking(use)
  use({
    "epwalsh/obsidian.nvim",
    after = {
      'which-key.nvim'
    },
    config = function()
      require("superconfig.plugins.obsidian")
    end
  })
end

local function editing_support(use)
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    event = 'BufWinEnter',
  })
  use({
    "jiangmiao/auto-pairs"
  })
  use({
    "gpanders/editorconfig.nvim"
  })
end

local function indenting(use)
  use({ 'Vimjas/vim-python-pep8-indent' })
  use({ 'jason0x43/vim-js-indent', ft = 'javascript' })
  use({ 'bitfyre/vim-indent-html', ft = 'html' })
end

local function util(use)
  use({ 'dstein64/vim-startuptime' })
end

require('packer').startup(function(use)
  use({
    'wbthomason/packer.nvim',
  })

  local components = {
    lsp, ui, autocomplete, navigation, git, syntax, keybinding,
    split_and_window, note_taking, editing_support, indenting, util
  }

  for _, component in ipairs(components) do
    component(use)
  end

  if packer_bootstrap then
    require('packer').sync()
  end
end)
