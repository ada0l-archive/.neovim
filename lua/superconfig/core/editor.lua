local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

g.mapleader = "\\"

-- default language
cmd[[ language en_US ]]

opt.fileformat = "unix"

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileencodings = "utf-8"

-- Tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Disable bell
opt.errorbells = false
opt.visualbell = true
opt.timeoutlen = 500

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.magic = true
opt.lazyredraw = false

-- Backups
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true -- Save undo history
opt.confirm = true -- prompt to save before destructive actions

-- Binary
ignore_files = {
    '*.aux', '*.out', '*.toc', '*.o', '*.obj', '*.dll', '*.jar',
    '*.pyc', '__pycache__', '*.rbc', '*.class',

    '*.ai', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.jpeg', '*.png',
    '*.psd', '*.webp', '*.avi', '*.m4a', '*.mp3', '*.oga', '*.ogg',
    '*.wav', '*.webm', '*.eot', '*.otf', '*.ttf', '*.woff', '*.doc',
    '*.pdf',

    'obj', 'bin',

    '*.zip', '*.tar.gz', '*.tar.bz2', '*.rar', '*.tar.xz',
    '*.*~', '*~ ', '*.swp', '.lock', '.DS_Store', 'tags.lock',

    '.git',
    '.idea',
    'venv',
    '.svn',

    '.git',
    '.svn',
    '*.exe',
    'node_modules'
}
opt.wildignore = opt.wildignore + ignore_files

-- keymap for russain language and spell
cmd[[
set fileformats=unix,dos,mac
set keymap=russian-jcukenwin
set iminsert=0
inoremap <c-l> <c-^>

"spell
autocmd FileType markdown sellocal spell spelllang=en_us,ru
]]

-- auto reloading file
opt.autoread = true

-- autocomplete
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.shortmess = opt.shortmess + { c = true }

-- perfomance
opt.redrawtime = 1500
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100

-- 2 spaces for js, ts, etc.
cmd([[
  autocmd FileType lua,json,typescript,javascript,vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
]])

-- visual
opt.so=3
opt.ttyfast = true
cmd[[ syntax on ]]
opt.ruler = true
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.signcolumn = "yes:1"
cmd[[ set colorcolumn=79 ]]
cmd[[ au FileType startup setlocal colorcolumn=0 ]]
opt.termguicolors = true
-- show invisible characters
opt.list = false
opt.listchars = {
    eol = ' ',
    tab = '→ ',
    extends = '…',
    precedes = '…',
    trail = '·',
}
-- disable :intro startup screen
opt.shortmess:append 'I'
