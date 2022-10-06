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

  -- cache plugins
  --[[ use({
    'lewis6991/impatient.nvim'
  }) ]]

  -- nice look
  use({
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('superconfig.plugins.gruvbox')
    end,
  })
  -- use({
  --   'projekt0n/github-nvim-theme',
  --   config = function()
  --     vim.cmd[[ colorscheme github_light ]]
  --     require('github-theme').setup({
  --       theme_style = "light",
  --       transparent = true
  --     })
  --   end
  -- })

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
    'nvim-lua/plenary.nvim'
  })

  -- git column signs
  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('superconfig.plugins.gitsigns')
    end,
    opt = true,
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

  -- neovim in browser
  use({
    'glacambre/firenvim',
    run = function()
      vim.fn['firenvim#install'](0)
    end
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
      --[[ {
        'L3MON4D3/LuaSnip',
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
        requires = {
          { "rafamadriz/friendly-snippets", },
        },
        before = 'nvim-cmp',
      }, ]]
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
    config = function()
      require('superconfig.plugins.treesitter')
    end
  })

  -- tags
  use({
    'liuchengxu/vista.vim',
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

  -- use({
  --   'D:/_PROJECTS/neovim/nvim-translator',
  --   as = 'nvim-translator',
  --   config = function()
  --     require"nvim-translator".setup()
  --   end
  -- })
  -- use({
  --   'D:/_PROJECTS/neovim/nvim-mabayui',
  --   config = function()
  --     require"mabayui".setup()
  --   end
  -- })
end)
