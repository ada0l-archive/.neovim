local path = require('lspconfig/util').path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    print(1)
    return path.join(vim.env.VIRTUAL_ENV, 'Scripts', 'python.exe')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ '*', '.*' }) do
    local match_env = vim.fn.glob(path.join(workspace, pattern, 'venv'))
    local match_poetry = vim.fn.glob(path.join(workspace, pattern, 'poetry.lock'))

    if match_env ~= '' then
      print(2)
      return path.join(match_env, 'Scripts', 'python.exe')
    end

    if match_poetry ~= '' then
      local handle= io.popen('cd ' .. workspace ..'&& poetry env info --path')

      local path_to_env = handle:read('*a')
      handle:close()

      path_to_env = path_to_env:sub(1, -2) -- delete \n
      path_to_env = path.join(path.join(path_to_env, 'Scripts', 'python.exe'))

      print(3)
      return path_to_env
    end

  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

local M = {
  name = 'pyright',
  settings = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = 'off',
          useLibraryCodeForTypes = true,
          completeFunctionParens = true,
        },
      },
    }
    --[[ before_init = function(_, config)
      a = get_python_path(config.root_dir)
      print("Load" .. a)
      config.settings.python.pythonPath = a
    end, ]]
  }
}

return M
