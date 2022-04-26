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
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    -- "gc" to comment visual regions/lines

    --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- use 'startup-nvim/startup.nvim'

    -- comment
    use 'numToStr/Comment.nvim'

    -- status line
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- themes
    use 'ellisonleao/gruvbox.nvim'
    use 'rockerBOO/boo-colorscheme-nvim'
    use 'tanvirtin/monokai.nvim'
    use 'shaunsingh/nord.nvim'
    use 'marko-cerovac/material.nvim'

    -- fast moving
    use 'phaazon/hop.nvim'

    -- git
    use { 'airblade/vim-gitgutter' }
    --use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'tpope/vim-fugitive' }

    -- tree
    use {
        'kyazdani42/nvim-tree.lua',
        tag='1.6.0',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use { "chentau/marks.nvim" }
    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }

    -- python
    use { "Vimjas/vim-python-pep8-indent" }


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
    'node_modules/*'
}
opt.wildignore = ignore_files

-- folding
opt.foldmethod = "marker"

-- keymap for russain language and spell
cmd[[
set fileformats=unix,dos,mac
set keymap=russian-jcukenwin
set iminsert=0

"spell
"set spell spelllang=en_us,ru
inoremap <c-l> <c-^>
]]

-- auto reloading file
opt.autoread = true
--}}}
--{{{ Auto commands
--}}}
--{{{ Visual
opt.so=999

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
vim.o.background = "dark"
vim.g.material_style = "darker"

cmd([[colorscheme gruvbox]])
-- cmd([[set guicursor=]])

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
set_keymap("n", "<leader><leader>o", ":tabnew ~/AppData/Local/nvim/init.lua<CR>")

-- source init.lua
set_keymap("n", "<leader><leader>s", ":source ~/AppData/Local/nvim/init.lua<CR>")

-- scrolling with search
set_keymap("n", "n", "nzzzv")
set_keymap("n", "N", "Nzzzv")

set_keymap("i", "jk", "<Esc>")

-- esc in terminal mode
set_keymap("t", "<Esc>", "<C-\\><C-n>")

-- disable highlight
set_keymap("n", "<leader><cr>", ":noh<cr>")

-- cd
set_keymap("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

-- split
set_keymap("n", "<leader>v", ":vsplit<CR>")
set_keymap("n", "<leader>s", ":split<CR>")

-- save, quit
set_keymap("n", "<leader>q", ":q<CR>")
set_keymap("n", "<leader>w", ":w<CR>")

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
        component_separators = { left = ' ', right = ' '},
        section_separators = { left = ' ', right = ' '},
        disabled_filetypes = { "NvimTree" },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff' },
        lualine_c = {'filename', 'diagnostics'},
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
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gb', '<c-o>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').pyright.setup {
    on_attach = on_attach
}
-- require('lspconfig').pylsp.setup {
--     cmd = {"pyls"},
--     filetypes = {"python"},
--     settings = {
--         pyls = {
--             configurationSources = {"flake8"},
--             plugins = {
--                 jedi_completion = {enabled = false},
--                 jedi_hover = {enabled = false},
--                 jedi_references = {enabled = false},
--                 jedi_signature_help = {enabled = false},
--                 jedi_symbols = {enabled = false, all_scopes = false},
--                 pycodestyle = {enabled = false},
--                 flake8 = {
--                     enabled = false,
--                     ignore = {},
--                     maxLineLength = 89
--                 },
--                 mypy = {enabled = false},
--                 isort = {enabled = false},
--                 yapf = {enabled = false},
--                 pylint = {enabled = true},
--                 pydocstyle = {enabled = false},
--                 mccabe = {enabled = false},
--                 preload = {enabled = false},
--                 rope_completion = {enabled = false}
--             -- configurationSources = {"flake8"},
--             -- plugins = {
--             --     -- jedi_completion = {enabled = true},
--             --     -- jedi_hover = {enabled = true},
--             --     -- jedi_references = {enabled = true},
--             --     -- jedi_signature_help = {enabled = true},
--             --     -- jedi_symbols = {enabled = true, all_scopes = true},
--             --     pycodestyle = {enabled = false},
--             --     flake8 = {
--             --         enabled = true,
--             --         ignore = {},
--             --         maxLineLength = 89
--             --     },
--             --     mypy = {enabled = false},
--             --     isort = {enabled = true},
--             --     yapf = {enabled = true},
--             --     pylint = {enabled = false},
--             --     pydocstyle = {enabled = false},
--             --     mccabe = {enabled = false},
--             --     preload = {enabled = false},
--             --     rope_completion = {enabled = true}
--             }
--         }
--     },
--     on_attach = on_attach
-- }
require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['csharp_ls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
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
        custom = ignore_files,
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
set_keymap("n", "<leader>N", ":NvimTreeFindFile<CR>")
--}}}2
--{{{2 Plugins/vim-gitgutter
cmd[[
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)
]]
--}}}2
--{{{2 Plugins/Comment.nvim
--
-- use gc to comment/uncomment
require('Comment').setup()
--}}}2
--{{{2 Plugins/telescope
require('telescope').setup{
    defaults = {
        file_ignore_patterns = ignore_files
    }
}
opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
--}}}2
--{{{2 Plugins/neogit
local neogit = require("neogit")

neogit.setup {
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size. 
    -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    commit_popup = {
        kind = "split",
    },
    -- Change the default way of opening neogit
    kind = "split",
    -- customize displayed signs
    signs = {
        -- { CLOSED, OPENED }
        section = { ">", "v" },
        item = { ">", "v" },
        hunk = { "", "" },
    },
    integrations = {
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
        -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
        --
        -- Requires you to have `sindrets/diffview.nvim` installed.
        -- use { 
        --   'TimUntersberger/neogit', 
        --   requires = { 
        --     'nvim-lua/plenary.nvim',
        --     'sindrets/diffview.nvim' 
        --   }
        -- }
        --
        diffview = false  
    },
    -- Setting any section to `false` will make the section not render at all
    sections = {
        untracked = {
            folded = false
        },
        unstaged = {
            folded = false
        },
        staged = {
            folded = false
        },
        stashes = {
            folded = true
        },
        unpulled = {
            folded = true
        },
        unmerged = {
            folded = false
        },
        recent = {
            folded = true
        },
    },
    -- override/add mappings
    mappings = {
        -- modify status buffer mappings
        status = {
            -- Adds a mapping with "B" as key that does the "BranchPopup" command
            ["B"] = "BranchPopup",
            -- Removes the default mapping of "s"
            ["s"] = "",
        }
    }
}
set_keymap("n", "<leader>g", ":Neogit<CR>")
--}}}2
--{{{2 Plugins/nvim-treesitter
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
--}}}2
--{{{2 Plugins/material.nvim
require('material').setup({
    contrast = {
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        line_numbers = false, -- Enable contrast background for line numbers
        sign_column = false, -- Enable contrast background for the sign column
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        popup_menu = false, -- Enable lighter background for the popup menu
    },

    italics = {
        comments = false, -- Enable italic comments
        keywords = false, -- Enable italic keywords
        functions = false, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false -- Enable italic variables
    },

    contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
        "terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf" -- Darker qf list background
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },

    disable = {
        borders = false, -- Disable borders between verticaly split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

    custom_highlights = {} -- Overwrite highlights with your own
})
--}}}
--{{{2 Plugins/startup
-- require"startup".setup({
--     -- every line should be same width without escaped \
--     header = {
--         type = "text",
--         oldfiles_directory = false,
--         align = "center",
--         fold_section = false,
--         title = "Header",
--         margin = 10,
--         content = {
--             -- " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
--             -- " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
--             -- " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
--             -- " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
--             -- " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
--             -- " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
-- -- "░░░░█▐▄▒▒▒▌▌▒▒▌░▌▒▐▐▐▒▒▐▒▒▌▒▀▄▀▄░",
-- -- "░░░█▐▒▒▀▀▌░▀▀▀░░▀▀▀░░▀▀▄▌▌▐▒▒▒▌▐░",
-- -- "░░▐▒▒▀▀▄▐░▀▀▄▄░░░░░░░░░░░▐▒▌▒▒▐░▌",
-- -- "░░▐▒▌▒▒▒▌░▄▄▄▄█▄░░░░░░░▄▄▄▐▐▄▄▀░░",
-- -- "░░▌▐▒▒▒▐░░░░░░░░░░░░░▀█▄░░░░▌▌░░░",
-- -- "▄▀▒▒▌▒▒▐░░░░░░░▄░░▄░░░░░▀▀░░▌▌░░░",
-- -- "▄▄▀▒▐▒▒▐░░░░░░░▐▀▀▀▄▄▀░░░░░░▌▌░░░",
-- -- "░░░░█▌▒▒▌░░░░░▐▒▒▒▒▒▌░░░░░░▐▐▒▀▀▄",
-- -- "░░▄▀▒▒▒▒▐░░░░░▐▒▒▒▒▐░░░░░▄█▄▒▐▒▒▒",
-- -- "▄▀▒▒▒▒▒▄██▀▄▄░░▀▄▄▀░░▄▄▀█▄░█▀▒▒▒▒",
-- "⣼⣴⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣶⣿⣿⣿⣿⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⢀⣠⣦⡀",
-- "⣿⣿⣿⠒⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⣀⣴⣸⡏⠀",
-- "⠻⠛⠁⠀⠀⠐⠿⠂⢀⣿⣶⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡖⣿⣿⣿⡟⠂",
-- "⠀⢀⣤⣤⠀⠀⠀⣠⣾⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣎⢻⠛⠁⠀",
-- "⠀⠀⠙⠋⠀⢠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⠏⢿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣆⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⢸⣿⣿⣿⡟⠀⠈⣿⣿⡟⢸⣿⣿⣿⣿⣿⣿⡄⠀⠀",
-- "⠀⠀⠀⠰⣾⡦⠙⠛⢿⠻⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⣸⣿⣿⡟⠀⠀⡀⢻⣿⠁⠸⣿⣿⣿⣿⣿⣿⣷⠀⠀",
-- "⠀⠀⠀⠀⠀⠀⠀⠀⢸⢀⣿⣿⣿⣿⣿⣿⠓⢶⢄⠀⣿⣿⡟⠀⢖⠕⠊⢹⠳⣤⡀⣿⣿⣿⣿⣿⣿⣿⡀⠀",
-- "⠀⠀⠀⠀⠀⠀⠀⠀⠈⠘⣿⣿⣿⣿⡿⠁⠀⠈⢧⢰⣿⠏⠀⢠⠃⠀⠀⠀⠀⠈⢒⣿⣿⣿⣻⣿⣿⣿⣧⠀",
-- "⠀⠀⣶⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡟⠀⠀⢰⠀⢘⡿⠃⠀⠀⠘⠀⡄⠀⠀⠀⠀⣸⣿⣿⡏⣿⣿⣿⣿⣿⣇",
-- "⠀⠒⣿⠒⣶⠀⠀⠀⠀⠀⢻⣿⣿⡷⣄⠀⢸⠠⣊⠁⠀⠀⠀⢡⡀⡇⠀⠀⣀⣾⣿⣿⣿⢿⣾⣿⣿⣿⣿⣿",
-- "⠀⠀⣿⠀⣿⠀⠀⠀⠀⠀⠘⣿⣿⣿⡉⠉⠛⠋⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠓⠊⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⠀⠠⠴⡖⠂⠀⠀⢰⣿⣿⣿⣧⡀⠀⠀⠀⠀⠑⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣎",
-- "⠀⠀⠀⠀⠉⢩⡏⠉⠀⣠⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠐⠒⠒⠂⠀⢀⣠⢶⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⠤⣤⣤⡶⠛⠁⢈⢎⣾⢿⣿⣿⣿⣿⣿⣿⣿⣿⣏",
-- "⠀⠀⠀⠀⠀⡀⠚⠋⠁⣾⣿⣿⣿⣿⣿⣿⣿⠿⠛⡝⠁⠀⡟⠉⠀⢀⡴⠁⡼⠃⡜⠈⠙⠻⢿⣿⣿⣿⣿⣿",
-- "⠀⠀⣀⡀⢾⣿⡆⠀⠀⣿⣿⣿⣿⡿⠛⢉⠀⠀⢠⠇⢃⠰⠀⢠⣖⠁⢀⠜⠀⡰⠁⠀⠀⠀⡠⠊⠙⣻⢿⣿",
-- "⠀⠘⠿⠋⠀⠁⠀⠀⠀⣿⣿⣼⠁⠀⠀⠀⢣⠄⢸⢀⣿⣦⠀⢸⡣⣷⣅⠀⠰⠁⠀⢀⠠⠊⠀⠀⡔⠀⠀⠹",
-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣇⠃⡄⠀⠀⠀⠀⢫⠜⠁⢹⣏⣤⣟⣼⠏⠈⢆⠃⣀⡔⠁⠀⠀⠀⡜⠀⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡏⠀⠡⠀⠀⠀⠀⠀⢫⢄⢀⣿⣿⣿⠁⠀⢀⡤⡪⠋⠀⠀⠀⠀⢠⠁⠀⠀⠀⠀",
-- "⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠘⠕⣆⠂⣿⣿⡿⠔⢊⠕⠉⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⡂⣼⣿⠡⠊⠁⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣵⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠗⠀⠀⠀⠀⠀⠀",
--         },
--         highlight = "Statement",
--         default_color = "",
--         oldfiles_amount = 0,
--     },
--     -- name which will be displayed and command
--     body = {
--         type = "mapping",
--         oldfiles_directory = false,
--         align = "center",
--         fold_section = false,
--         title = "Basic Commands",
--         margin = 5,
--         content = {
--             -- { " Find File", "Telescope find_files", "<leader>ff" },
--             -- { " Find Word", "Telescope live_grep", "<leader>lg" },
--             -- { " Recent Files", "Telescope oldfiles", "<leader>of" },
--             -- { " File Browser", "Telescope file_browser", "<leader>fb" },
--             -- { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
--             -- { " New File", "lua require'startup'.new_file()", "<leader>nf" },
--         },
--         highlight = "String",
--         default_color = "",
--         oldfiles_amount = 0,
--     },
--     footer = {
--         type = "text",
--         oldfiles_directory = false,
--         align = "center",
--         fold_section = false,
--         title = "Footer",
--         margin = 5,
--         content = { "" },
--         highlight = "Number",
--         default_color = "",
--         oldfiles_amount = 0,
--     },
--
--     options = {
--         mapping_keys = true,
--         cursor_column = 0.5,
--         empty_lines_between_mappings = true,
--         disable_statuslines = true,
--         paddings = { 1, 3, 3, 0 },
--     },
--     mappings = {
--         execute_command = "<CR>",
--         open_file = "o",
--         open_file_split = "<c-o>",
--         open_section = "<TAB>",
--         open_help = "?",
--     },
--     colors = {
--         background = "#1f2227",
--         folded_section = "#56b6c2",
--     },
--     parts = { "header" },
-- })
--}}}2
--}}}
