vim.o.guifont = "JetBrainsMono Nerd Font:h13"

local ok, err = pcall(require, "superconfig")

if not ok then
  error(("Error loading core...\n\n%s"):format(err))
end
