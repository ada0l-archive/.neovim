local dap = require('dap')
local dapui = require('dapui')


dapui.setup({
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 55,
      position = "right",
    },
    {
      elements = { "repl", "console" },
      size = 0.15,
      position = "bottom",
    },
  },
  render = {
    max_value_lines = 3,
  },
  floating = { max_width = 0.9, max_height = 0.5, border = "rounded" },
})

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

local adapters = require('superconfig.plugins.dap.adapters')
local configurations = require('superconfig.plugins.dap.configurations')


for _, adapter in ipairs(adapters) do
  dap.adapters[adapter.name] = adapter.settings
end


for _, configuration in ipairs(configurations) do
  dap.configurations[configuration.name] = configuration.settings
end

require('superconfig.plugins.dap.mapping')
