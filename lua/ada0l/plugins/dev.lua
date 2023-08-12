return {
  {
    dir = '/home/ada0l/Documents/projects/obsidian',
    name = 'obsidian',
    dev = true,
    keys = {
      {
        '<leader>ov',
        function()
          Obsidian.select_vault()
        end,
        desc = "[Obsidian] Select vault",
      },
      {
        '<leader>oo',
        function()
          Obsidian.get_current_vault(function()
            Obsidian.cd_vault()
          end)
        end,
        desc = '[Obsidian] Open Obsidian directory',
      },
      {
        '<leader>ot',
        function()
          Obsidian.get_current_vault(function()
            Obsidian.open_today()
          end)
        end,
        desc = '[Obsidian] Open today',
      },
      {
        '<leader>od',
        function()
          Obsidian.get_current_vault(function()
            vim.ui.input({ prompt = 'Write shift in days: ' }, function(input_shift)
              local shift = tonumber(input_shift) * 60 * 60 * 24
              Obsidian.open_today(shift)
            end)
          end)
        end,
        desc = '[Obsidian] Open daily node with shift',
      },
      {
        '<leader>on',
        function()
          Obsidian.get_current_vault(function()
            vim.ui.input({ prompt = 'Write name of new note: ' }, function(name)
              Obsidian.new_note(name)
            end)
          end)
        end,
        desc = '[Obsidian] New note',
      },
      {
        '<leader>oi',
        function()
          Obsidian.get_current_vault(function()
            Obsidian.select_template('telescope')
          end)
        end,
        desc = '[Obsidian] Insert template',
      },
      {
        '<leader>os',
        function()
          Obsidian.get_current_vault(function()
            Obsidian.search_note('telescope')
          end)
        end,
        desc = '[Obsidian] Search note',
      },
      {
        '<leader>ob',
        function()
          Obsidian.get_current_vault(function()
            Obsidian.select_backlinks('telescope')
          end)
        end,
        desc = '[Obsidian] Select backlink',
      },
      {
        '<leader>or',
        function()
          Obsidian.get_current_vault(function()
            vim.ui.input({ prompt = 'Rename file to' }, function(name)
              Obsidian.rename(name)
            end)
          end)
        end,
        desc = '[Obsidian] Rename file with updating links',
      },
      {
        "gf",
        function()
          if Obsidian.found_wikilink_under_cursor() ~= nil then
            return "<cmd>lua Obsidian.get_current_vault(function() Obsidian.go_to() end)<CR>"
          else
            return "gf"
          end
        end,
        noremap = false,
        expr = true
      }
    },
    opts = function()
      ---@param filename string
      ---@return string
      local transformator = function(filename)
        if filename ~= nil and filename ~= '' then
          return filename
        end
        return string.format('%d', os.time())
      end
      return {
        vaults = {
          {
            dir = '~/Documents/Knowledge/',
            templates = {
              dir = 'templates/',
              date = '%Y-%d-%m',
              time = '%Y-%d-%m',
            },
            note = {
              dir = '',
              transformator = transformator,
            },
          },
          {
            dir = '~/Documents/SyncObsidian/',
            daily = {
              dir = '01.daily/',
              format = '%Y-%m-%d',
            },
            templates = {
              dir = 'templates/',
              date = '%Y-%d-%m',
              time = '%Y-%d-%m',
            },
            note = {
              dir = 'notes/',
              transformator = transformator,
            },
          }
        }
      }
    end
  },
}
