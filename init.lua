vim.cmd[[let $PATH = 'C:\\Program Files\\Git\\usr\\bin;' . $PATH]]

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end
]]

require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'
    -- fast moving
    use 'phaazon/hop.nvim'
    -- git
    use 'lewis6991/gitsigns.nvim'
    -- colorschemes
    use 'marko-cerovac/material.nvim'
    -- status line
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    -- filemanager
    use { 'theblob42/drex.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    -- searching
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
    -- Comments
    -- gc - line comment
    -- gb - multi line comment
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
    -- cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    -- luasnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    -- lsp
    use 'neovim/nvim-lspconfig'
    use { 'creativenull/efmls-configs-nvim', tag = 'v0.1.2' }
    use { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end }
    -- highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'lewis6991/spellsitter.nvim', config = function() require('spellsitter').setup() end }
    -- go
    use 'fatih/vim-go'
    -- python
    use { 'Vimjas/vim-python-pep8-indent' }
    -- javascript
    use { 'jason0x43/vim-js-indent' }
    -- markdown
    use { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end, }
    -- terminal
    use 's1n7ax/nvim-terminal'
    -- discord
    use 'andweeb/presence.nvim'
end)

require('general')
require('visual')
require('mapping')

require('plugins/hop')
require('plugins/gitsigns')
require('plugins/lualine')
require('plugins/drex')
require('plugins/fzf')
require('plugins/nvim-cmp')
require('plugins/lspconfig')
require('plugins/treessitter')
require('plugins/presence')
require('plugins/terminal')
require('plugins/colorscheme')
