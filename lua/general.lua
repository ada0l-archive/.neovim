vim.opt.fileformat = "unix"
-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"
-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- Disable bell
vim.opt.errorbells = false
vim.opt.visualbell = true
vim.opt.timeoutlen = 500
-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.magic = true
vim.opt.lazyredraw = false
-- Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true -- Save undo history
vim.opt.confirm = true -- prompt to save before destructive actions
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
    'node_modules/*'
}
vim.opt.wildignore = ignore_files
-- folding
vim.opt.foldmethod = "marker"
-- keymap for russain language and spell
vim.cmd[[
set fileformats=unix,dos,mac
set keymap=russian-jcukenwin
set iminsert=0
inoremap <c-l> <c-^>

"spell
autocmd FileType markdown seltlocal spell spelllang=en_us,ru
]]
-- auto reloading file
vim.opt.autoread = true
-- perfomance
vim.opt.redrawtime = 1500
vim.opt.timeoutlen = 250
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 100
-- 2 spaces for js, ts, etc.
vim.cmd([[
autocmd FileType json,typescript,javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
]])

