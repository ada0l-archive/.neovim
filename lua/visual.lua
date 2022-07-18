vim.opt.so=3

vim.opt.ttyfast = true

vim.cmd[[ syntax on ]]

vim.opt.ruler = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.signcolumn = "yes:1"
vim.cmd[[ set colorcolumn=79 ]]
vim.cmd[[ au FileType startup setlocal colorcolumn=0 ]]

vim.opt.termguicolors = true

-- show invisible characters
vim.opt.list = false
vim.opt.listchars = {
    eol = ' ',
    tab = '→ ',
    extends = '…',
    precedes = '…',
    trail = '·',
}

-- disable :intro startup screen
vim.opt.shortmess:append 'I'
