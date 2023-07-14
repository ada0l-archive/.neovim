local opt = vim.opt

local utils = require("superconfig.core.utils")
local set_options = utils.set_options

local ignore_files = {
  "*.aux",
  "*.toc",
  "*.o",
  "*.obj",
  "*.dll",
  "*.jar",
  "*.pyc",
  "__pycache__",
  "*.rbc",
  "*.class",

  "*.ai",
  "*.bmp",
  "*.gif",
  "*.ico",
  "*.jpg",
  "*.jpeg",
  "*.png",
  "*.psd",
  "*.webp",
  "*.avi",
  "*.m4a",
  "*.mp3",
  "*.oga",
  "*.ogg",
  "*.wav",
  "*.webm",
  "*.eot",
  "*.otf",
  "*.ttf",
  "*.woff",
  "*.doc",
  "*.pdf",
  ".null-ls*",

  "obj",
  "bin",

  "*.zip",
  "*.tar.gz",
  "*.tar.bz2",
  "*.rar",
  "*.tar.xz",
  "*.*~",
  "*~ ",
  "*.swp",
  ".lock",
  ".DS_Store",
  "tags.lock",

  ".git",
  ".idea",
  "venv",
  ".svn",

  "*.exe",
  "node_modules",
}
-- default language
-- cmd[[ language en_US ]]

set_options({
  fileformat = "unix",
  encoding = "utf-8",
  fileencoding = "utf-8",
  -- perfomance
  timeoutlen = 300,
  updatetime = 200,
  -- ui
  scrolloff = 8,
  relativenumber = true,
  number = true,
  wrap = false,
  signcolumn = "yes",
  termguicolors = true,
  -- search
  inccommand = "split",
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  showmatch = true,
  magic = true,
  wildignore = opt.wildignore + ignore_files,
  -- auto reloading file
  autoread = true,
  -- autocomplete
  completeopt = { "menu", "menuone", "noselect" },
  shortmess = opt.shortmess + { c = true },
  pumheight = 10,
  pumblend = 10,
  -- split
  splitbelow = true,
  splitright = true,
  -- Tabs
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,
  -- Disable bell
  errorbells = false,
  visualbell = true,
  --disable backupds
  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true,
  undolevels = 10000,
  confirm = true,
  -- clipboard
  clipboard = "unnamedplus",
})

opt.shortmess:append("I")
