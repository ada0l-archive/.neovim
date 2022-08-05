sections = {
  lualine_a = {
    {'filetype', icon_only = true},
    {
      'filename',
      path = 0,
      symbols = {
        modified = ' + ',
        readonly = ' - ',
        unnamed = '[No Name]',
      }
    }
  },
  lualine_b = {
    'branch',
    'diff'
  },
  lualine_c = {
    'diagnostics'
  },
  lualine_x = {
  },
  lualine_y = {
    'progress'
  },
  lualine_z = {
    'location'
  }
}

if vim.fn.exists('g:started_by_firenvim') == 1 then
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = { "NvimTree" },
    always_divide_middle = true,
    globalstatus = false,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = sections,
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}
