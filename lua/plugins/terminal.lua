vim.o.hidden = true

require('nvim-terminal').setup({
    window = {
        position = 'botright',
        split = 'sp',
        width = 50,
        height = 15,
    },
    disable_default_keymaps = false,
    window_height_change_amount = 2,
    window_width_change_amount = 2,
    increase_width_keymap = '<leader><leader>+',
    decrease_width_keymap = '<leader><leader>-',
    increase_height_keymap = '<leader>+',
    decrease_height_keymap = '<leader>-',
    terminals = {
        {keymap = '<leader>t1'},
        {keymap = '<leader>t2'},
        {keymap = '<leader>t3'},
        {keymap = '<leader>t4'},
        {keymap = '<leader>t5'},
    },
})
