local M = {}

--- Call on_attach function when lsp attached
---
---@param on_attach function
-- -@return nil
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

--- Map vim key maps with default options:
--- <pre>lua
--- local options = {
---   noremap = true,
---   silent = false,
--- }
--- </pre>
---
---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param opts table|nil
---@return nil
function M.map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = false,
  }
  if opts then
    options = vim.tbl_deep_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

--- Check exist of file
---
---@param name string
---@return boolean
function M.file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M._get_python_venv()
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    return cwd .. '/venv/bin/python'
  elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    return cwd .. '/.venv/bin/python'
  elseif vim.fn.executable('poetry') == 1 and M.file_exists(cwd .. '/pyproject.toml') then
    local cmd = 'poetry env info -p'
    local handle = io.popen(cmd)
    ---@diagnostic disable-next-line: need-check-nil
    local result = handle:read('*a')
    ---@diagnostic disable-next-line: need-check-nil
    local status = { handle:close() }
    if status[3] ~= nil then
      print('poetry status is not zero. ' .. result)
      return vim.fn.system('which python')
    end
    result = result:gsub('\n', '')
    return result .. '/bin/python3'
  else
    return vim.fn.system('which python')
  end
end

--- Looks for a python environment. Priority is given to local environments that are
--- in ./venv or poetry. Can be used to call a repr or environment redefinition for lsp.
--- The function caches the path the first time it is called. In case you need to define
--- the path again, you need to pass the parameter:
--- <pre>lua
--- { force = true }
--- </pre>
---
---@param params table
---@return string
function M.get_python_venv(params)
  params = params or { force = false }
  if params['force'] ~= false and vim.g.cached_python_venv ~= nil then
    print('Found ' .. vim.g.cached_python_venv)
    return vim.g.cached_python_venv
  end
  vim.g.cached_python_venv = M._get_python_venv()
  print('Found ' .. vim.g.cached_python_venv)
  return vim.g.cached_python_venv
end

function M.goto_window(direction)
  local win = vim.fn.getwininfo(vim.fn.win_getid())[1]
  local topline, height = win.topline, win.height
  local scrolloff = vim.api.nvim_get_option('scrolloff')
  direction = direction or "center"
  local get_line_funcs = {
    top = function()
      return topline + scrolloff
    end,
    center = function()
      return math.min(
        math.floor(topline / 2 + topline / 2 + height / 2),
        vim.fn.line("$")
      )
    end,
    bottom = function()
      return topline + (height - 1) - scrolloff
    end
  }
  vim.api.nvim_command(string.format("%s", get_line_funcs[direction]()))
end

return M
