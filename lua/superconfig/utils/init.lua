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

function M.get_python_venv()
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    return cwd .. '/venv/bin/python'
  elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    return cwd .. '/.venv/bin/python'
  else
    return '/bin/python3'
  end
end

return M
