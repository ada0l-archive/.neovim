local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    name = "Vista",
    v = { ":Vista<CR>", "Vista" },
  }
})

vim.cmd [[
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ 'ts': 'vim_lsp',
  \ }
]]
