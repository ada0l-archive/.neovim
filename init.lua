-- zc - close fold
-- zo - open fold
-- zM - close all folds
-- zR - open all folds

--{{{ make alias for api
local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options
--}}}

--{{{ Packer
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
--}}}

--{{{ Plugins
require('packer').startup(function(use)

    -- packer
    use 'wbthomason/packer.nvim'

    -- Collection of configurations for the built-in LSP client
    use 'neovim/nvim-lspconfig' 

    -- use 'williamboman/nvim-lsp-installer'
    -- autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    -- TODO: telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- "gc" to comment visual regions/lines
    
    -- comment
    use 'numToStr/Comment.nvim'

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- themes
    use 'ellisonleao/gruvbox.nvim'
    use 'rockerBOO/boo-colorscheme-nvim'
    use 'tanvirtin/monokai.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    -- fast moving
    use 'phaazon/hop.nvim'

    -- git signs
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    -- tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        }
    }

    use {
        "chentau/marks.nvim"
    }


end)
--}}}

--{{{ General
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
opt.visualbell = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

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
    -- media
    '*.ai', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.jpeg', '*.png',
    '*.psd', '*.webp', '*.avi', '*.m4a', '*.mp3', '*.oga', '*.ogg',
    '*.wav', '*.webm', '*.eot', '*.otf', '*.ttf', '*.woff', '*.doc',
    '*.pdf',
    -- archives
    '*.zip', '*.tar.gz', '*.tar.bz2', '*.rar', '*.tar.xz',
    -- temp/system
    '*.*~', '*~ ', '*.swp', '.lock', '.DS_Store', '._*', 'tags.lock',
    -- version control
    '.git',
    '.svn',
    -- exe
    '*.exe'
}
opt.wildignore = ignore_files

-- folding
opt.foldmethod = "marker"

-- keymap for russain language and spell
cmd[[
set fileformats=unix,dos,mac
set keymap=russian-jcukenwin
set iminsert=0

" spell
"set spell spelllang=en_us,ru
]]

-- auto reloading file
opt.autoread = true
--}}}

--{{{ Auto commands
--}}}

--{{{ Visual
opt.so=999
cmd[[ syntax on ]]
opt.ruler = true
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.signcolumn = "yes:1"
cmd[[ set colorcolumn=70 ]]
opt.termguicolors = true
vim.o.background = "dark"
cmd([[colorscheme gruvbox]])

-- show invisible characters
opt.list = true
opt.listchars = {
    eol = ' ', -- ¬↴
    tab = '→ ',
    extends = '…',
    precedes = '…',
    trail = '·',
}

-- disable :intro startup screen
opt.shortmess:append 'I'
--}}}

--{{{ Mapping functions
function set_keymap(mode, from, to)
    local opts = {noremap = true, silent = false}
    vim.api.nvim_set_keymap(mode, from, to, opts)
end

function nvim_set_keymap(mode, from, to, opts)
    vim.api.nvim_set_keymap(mode, from, to, opts)
end
--}}}

--{{{ Mapping
g.mapleader = "\\"

-- open init.lua
set_keymap("n", "<leader>vo", ":tabnew ~/AppData/Local/nvim/init.lua<CR>")

-- source init.lua
set_keymap("n", "<leader>vs", ":source ~/AppData/Local/nvim/init.lua<CR>")

-- scrolling with search
set_keymap("n", "n", "nzzzv")
set_keymap("n", "N", "Nzzzv")

-- esc in terminal mode
set_keymap("t", "<Esc>", "<C-\\><C-n>")

-- disable highlight
set_keymap("n", "<leader><cr>", ":noh<cr>")

-- buffers
set_keymap("n", "<leader>b", ":buffers<cr>:b ")

-- cd
set_keymap("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

-- Editing Mapping

-- better indenting
set_keymap("v", ">", ">gv")
set_keymap("v", "<", "<gv")

-- move line
set_keymap("v", "J", ":m '>+1<CR>gv=gv")
set_keymap("v", "K", ":m '<-2<CR>gv=gv")

--}}}

--{{{ Plugins Configuration

--{{{2 Plugins/LuaLine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {},
}
---}}}2

--{{{2  Plugins/hop
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', jump_on_sole_occurrence = false }
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
--}}}2

--{{{2 Plugins/cmp
local cmp = require'cmp'
cmp.setup({
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
--}}}2

--{{{2 Plugins/lsp-config

local opts = { noremap=true, silent=false }
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['pyright'].setup {
    capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
}
--}}}2

--{{{2 Plugins/tree
require'nvim-tree'.setup {
    auto_close = false,
    auto_reload_on_write = true,
    disable_netrw = false,
    hide_root_folder = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 30,
        height = 30,
        side = "right",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = nil,
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = ignore_files,
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            git = false,
        },
    },
}

set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>")
--}}}2

--{{{2 Plugins/gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
--}}}2

--{{{2 Plugins/Comment.nvim
--
-- use gc to comment/uncomment
require('Comment').setup()
--}}}2

--{{{2 Plugins/marks.nvim
require'marks'.setup {
  -- whether to map keybinds or not. default true
  --default_mappings = true,
  -- which builtin marks to show. default {}
  --builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  --cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  --force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  --refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  --sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  --excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  --bookmark_0 = {
    --sign = "⚑",
    --virt_text = "hello world"
  --},
  --mappings = {}
}
--}}}2

--{{{2 Plugins/telescope
require('telescope').setup{
    defaults = {
        file_ignore_patterns = ignore_files
    }
}
opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader><leader>b", "<cmd>Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader><leader>f", "<cmd>Telescope find_files<cr>", opts)
--}}}2
--}}}
