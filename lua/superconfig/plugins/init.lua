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
  use({
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('superconfig.plugins.gruvbox')
    end,
  })

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

  use({
    'kdheepak/lazygit.nvim',
    config = function()
      require('superconfig.plugins.lazygit')
    end,
  })

  -- git column signs
  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      -- require('gitsigns').setup()
      require('superconfig.plugins.gitsigns')
    end,
  })

  -- filemanager
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('superconfig.plugins.nvim-tree')
    end,
    cmd = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
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
    },
    tag='nvim-0.6',
    config = function()
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
  use({
    'junegunn/goyo.vim',
    cmd = 'Goyo'
  })

  -- lsp
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('superconfig.lsp')
    end,
    requires = {
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('superconfig.plugins.lsp-signature')
        end,
        after = 'nvim-lspconfig',
      },
    },
    event = 'BufWinEnter',
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('superconfig.lsp.providers.null_ls')
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
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    },
    event = 'InsertEnter',
  })

  -- lang/syntax stuff
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    tag='v0.8.1',
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
      require('superconfig.plugins.hop.mapping')
    end
  })

  -- markdown
  use({
    'davidgranstrom/nvim-markdown-preview',
    cmd = 'MarkdownPreview'
  })

  -- go
  use({
    'fatih/vim-go',
    ft = 'go'
  })

  -- python
  use({
    'Vimjas/vim-python-pep8-indent',
    ft = 'py'
  })

  -- javascript
  use({
    'jason0x43/vim-js-indent',
    ft = 'js'
  })

  -- html
  use({
    'bitfyre/vim-indent-html',
    ft = 'html'
  })

  -- obsidian
  use({
    'epwalsh/obsidian.nvim',
    config = function()
      require('superconfig.plugins.obsidian')
    end,
    after = 'nvim-cmp'
  })
end)
