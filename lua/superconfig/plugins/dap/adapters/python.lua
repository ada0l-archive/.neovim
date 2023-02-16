local M = {
  name = 'python',
  settings = {
    type = 'executable',
    command = '/home/ada0l/.config/nvim/py_venv/bin/python3',
    args = { '-m', 'debugpy.adapter' },
  }
}

return M
