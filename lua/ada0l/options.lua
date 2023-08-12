vim.g.mapleader = ' '

vim.opt.compatible = false

vim.opt.fileformat = 'unix'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- swap is shit
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.confirm = true

vim.opt.timeoutlen = 300
vim.opt.updatetime = 200

vim.opt.ttyfast = true
vim.opt.lazyredraw = true

vim.opt.scrolloff = 8
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3

vim.opt.inccommand = 'split'
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.magic = true

vim.opt.autoread = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.o.completeopt = 'menuone,noinsert,noselect' -- Customize completions
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.pumheight = 10
vim.opt.pumblend = 10

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.errorbells = false
vim.opt.visualbell = true
