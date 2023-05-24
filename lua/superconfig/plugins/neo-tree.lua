local wk = require("which-key")

require("neo-tree").setup({
  popup_border_style = 'single',
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        "node_modules"
      },
    }
  }
})
