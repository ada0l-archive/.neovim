local utils = require('superconfig.utils')

local local_file = vim.fn.getcwd() .. "/.nvim.lua"


if utils.file_exists(local_file) then
  dofile(local_file)
end


utils.load_mods({
  'superconfig.plugins',
  'superconfig.core',
})
