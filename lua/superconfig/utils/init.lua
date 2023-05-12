local M = {}

function M.merge(...)
  return vim.tbl_deep_extend('force', ...)
end

function M.map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = false
  }
  if opts then
    options = M.merge(options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.buf_map(bufnr, mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true
  }
  if opts then
    options = M.merge(options, opts)
  end
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end

function M.load_mods(mods)
  for _, mod in ipairs(mods) do
    local ok, err = pcall(require, mod)
    if not ok then
      error(('Error loading %s...\n\n%s'):format(mod, err))
    end
  end
end

function M.set_options(options)
  for key, value in pairs(options) do
    vim.opt[key] = value
  end
end

function M.file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M.dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

function M._get_python_venv()
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    return cwd .. '/venv/bin/python'
  elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    return cwd .. '/.venv/bin/python'
  elseif vim.fn.executable("poetry") == 1 and M.file_exists(cwd .. "/pyproject.toml") then
    local cmd = "poetry env info -p"
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    local status = { handle:close() }
    if status[3] ~= nil then
      print("poetry status is not zero. " .. result)
      return vim.fn.system("which python")
    end
    result = result:gsub("\n", "")
    return result .. "/bin/python3"
  else
    return vim.fn.system("which python")
  end
end

function M.get_python_venv(params)
  params = params or { force = false }
  if params["force"] ~= false and vim.g.cached_python_venv ~= nil then
    return vim.g.cached_python_venv
  end
  vim.g.cached_python_venv = M._get_python_venv()
  return vim.g.cached_python_venv
end

return M
