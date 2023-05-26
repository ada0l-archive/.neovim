local utils = require("superconfig.core.utils")

vim.api.nvim_create_user_command("CreateLocalNvim", "!echo " ..
  "\"vim.g.ada0l_trim_trailing_disabled=true;vim.g.ada0l_format_autosave_disabled=true\""
  .. " >> .nvim.lua", { nargs = 0 })

vim.api.nvim_create_user_command("GetPythonVenvForce", "lua require('superconfig.core.utils').get_python_venv({force=true})",
  { nargs = 0 })

function _G.ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

vim.api.nvim_create_user_command("ReloadConfig", ":lua ReloadConfig()<CR>",
  { nargs = 0 })
