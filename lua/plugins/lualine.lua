require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        disabled_filetypes = { "drex" },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'filename'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'diagnostics'},
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
    -- tabline = {},
    -- extensions = {},
}
