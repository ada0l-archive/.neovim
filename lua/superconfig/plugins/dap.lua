local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"

return {
  "rcarriga/nvim-dap-ui",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "mfussenegger/nvim-dap" },
    { "mxsdev/nvim-dap-vscode-js" },
    { "mfussenegger/nvim-dap-python" },
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    },
  },
  config = function()
    require("dap-vscode-js").setup {
      node_path = "node",
      debugger_path = DEBUGGER_PATH,
      -- debugger_cmd = { "js-debug-adapter" },
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
    }
    require('dap-python').setup('~/tools/debugpy/bin/python',
      { pythonPath = require("superconfig.core.utils").get_python_venv() })
    local dap, dapui, wk = require("dap"), require("dapui"), require("which-key")
    dapui.setup({
      layouts = {
        {
          elements = {
            -- Elements can be strings or table with id and size keys.
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40, -- 40 columns
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25, -- 25% of total lines
          position = "bottom",
        },
      },
    })

    wk.register({
      ["<leader>"] = {
        name = "dap ui",
        --["do"] = { ":lua require('dapui').open()<CR>", "Open DAP" },
        ["db"] = { ":DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
        ["dc"] = { ":DapContinue<CR>", "Continue DAP" },
        ["dx"] = { ":lua require('dapui').toggle()<CR>", "Close DAP" },
      }
    })


    -- dap.listeners.after.event_initialized["dapui_config"] = function()
    --   dapui.open()
    -- end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end

    for _, language in ipairs { "typescript", "javascript" } do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest Tests",
          -- trace = true, -- include debugger info
          runtimeExecutable = "node",
          runtimeArgs = {
            "./node_modules/jest/bin/jest.js",
            "--runInBand",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
      }
    end
  end
}
