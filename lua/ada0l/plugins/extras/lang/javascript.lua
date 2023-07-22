return {
  { 'jason0x43/vim-js-indent', ft = 'javascript' },
  {
    'neovim/nvim-lspconfig',
    optional = true,
    opts = {
      servers = {
        volar = {
          init_options = {
            typescript = {
              tsdk = '/usr/local/lib/node_modules/typescript/lib',
            },
          },
          filetypes = { 'vue' },
        },
        tsserver = {
          settings = {
            diagnostics = { ignoredCodes = { 7044 } },
            filetypes = {
              'javascript',
              'javascriptreact',
              'javascript.jsx',
              'typescript',
              'typescriptreact',
              'typescript.tsx',
            },
          },
        },
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      { 'mxsdev/nvim-dap-vscode-js' },
      {
        'microsoft/vscode-js-debug',
        build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
      },
    },
    opts = function()
      local DEBUGGER_PATH = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug'
      require('dap-vscode-js').setup({
        node_path = 'node',
        debugger_path = DEBUGGER_PATH,
        -- debugger_cmd = { "js-debug-adapter" },
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
      })
      local dap = require('dap')
      for _, language in ipairs({ 'typescript', 'javascript' }) do
        dap.configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Debug Jest Tests',
            -- trace = true, -- include debugger info
            runtimeExecutable = 'node',
            runtimeArgs = {
              './node_modules/jest/bin/jest.js',
              '--runInBand',
            },
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
            internalConsoleOptions = 'neverOpen',
          },
        }
      end
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, {
          'svelte',
          'vue',
          'jsdoc',
          'javascript',
          'typescript',
          'prisma',
        })
      end
    end,
  },
}
