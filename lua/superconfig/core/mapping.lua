local utils = require("superconfig.core.utils")
local map = utils.map

-- scrolling with search
map("n", "n", "nzzzv", {})
map("n", "N", "Nzzzv", {})

map("t", "<c-K>", "<up>", {})
map("t", "<c-J>", "<down>", {})

-- disable highlight
map("n", "<leader><cr>", ":noh<cr>", { desc = "Clear search" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear search" })

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- disable annoying error woth auto complete
map("n", "<tab>", "", {})

-- cd
map("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>", {})

-- save, quit
map("n", "<leader>q", ":q<CR>", {})
map("n", "<leader>w", ":w<CR>", {})

-- navigation between tabs
map("n", "<leader>1", "1gt", {})
map("n", "<leader>2", "2gt", {})
map("n", "<leader>3", "3gt", {})
map("n", "<leader>4", "4gt", {})
map("n", "<leader>5", "5gt", {})
map("n", "<leader>6", "6gt", {})

-- map('n', '<leader><tab>', ':e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>')

map("n", "<c-e>", "5<c-e>", {})
map("n", "<c-y>", "5<c-y>", {})

-- for maintain Visual Mode after shifting > and <
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- switch language
map("i", "<c-l>", "<c-^>")
map("n", "<c-l>", "<c-^>")

-- Move visual block
vim.cmd([[
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
]])

vim.cmd([[
cno $h ~/
cno $p ~/Documents/projects/

cnoremap <c-P> <up>
cnoremap <c-N> <down>
]])
