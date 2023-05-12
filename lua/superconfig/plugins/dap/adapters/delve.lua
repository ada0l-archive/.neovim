local M = {
  name = 'delve',
  settings = {
    type = 'server',
    port = '${port}',
    executable = {
      command = 'dlv',
      args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
  }
}

return M
