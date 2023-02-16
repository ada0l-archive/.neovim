local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

local utils = require('superconfig.utils')
local set_options = utils.set_options

local ignore_files = {
  '*.aux', '*.toc', '*.o', '*.obj', '*.dll', '*.jar',
  '*.pyc', '__pycache__', '*.rbc', '*.class',

  '*.ai', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.jpeg', '*.png',
  '*.psd', '*.webp', '*.avi', '*.m4a', '*.mp3', '*.oga', '*.ogg',
  '*.wav', '*.webm', '*.eot', '*.otf', '*.ttf', '*.woff', '*.doc',
  '*.pdf',
  '.null-ls*',

  'obj', 'bin',

  '*.zip', '*.tar.gz', '*.tar.bz2', '*.rar', '*.tar.xz',
  '*.*~', '*~ ', '*.swp', '.lock', '.DS_Store', 'tags.lock',

  '.git',
  '.idea',
  'venv',
  '.svn',

  '*.exe',
  'node_modules'
}

g.mapleader = "\\"

-- default language
-- cmd[[ language en_US ]]

set_options({
  fileformat = "unix",
  -- utf-8
  encoding = "utf-8",
  fileencoding = "utf-8",
  fileencodings = "utf-8",
  --disable backupds
  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true,
  confirm = true,
  -- Tabs
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,
  -- Disable bell
  errorbells = false,
  visualbell = true,
  timeoutlen = 500,
  -- Search
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  showmatch = true,
  magic = true,
  lazyredraw = false,
  wildignore = opt.wildignore + ignore_files,
  -- auto reloading file
  autoread = true,
  -- autocomplete
  completeopt = { 'menu', 'menuone', 'noselect' },
  shortmess = opt.shortmess + { c = true },
  -- perfomance
  redrawtime = 1500,
  timeoutlen = 500,
  ttimeoutlen = 10,
  updatetime = 100,
  ttyfast = true,
  -- visual
  so = 7,
  ruler = true,
  number = true,
  relativenumber = true,
  wrap = false,
  signcolumn = "yes:1",
  termguicolors = true,
  colorcolumn = "79",
  -- invisible characters,
  list = true,
  listchars = {
    eol = ' ',
    tab = '→ ',
    extends = '…',
    precedes = '…',
    trail = '·',
  },
  -- russian layout
  keymap = 'russian-jcukenwin',
  iminsert = 0,
})

-- disable :intro startup screen,
opt.shortmess:append 'I'

cmd [[set iminsert=0 ]]

-- spell
cmd [[ autocmd FileType markdown setlocal spell spelllang=en_us,ru ]]

-- 2 spaces for js, ts, etc.
cmd([[autocmd FileType lua,json,typescript,javascript,vue setlocal shiftwidth=2 tabstop=2 softtabstop=2]])
cmd([[autocmd BufEnter *.bnf setlocal ft=enbf]])

-- delete trailing whitespace
cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

-- visual
cmd [[ syntax on ]]
