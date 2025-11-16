-- Directory picker helpers for snacks.nvim
-- Provides directory selection UI before searching
local M = {}

local function get_directories()
  local directories = {}

  local handle = io.popen 'fd . --type directory --hidden --exclude .git --exclude node_modules'
  if handle then
    for line in handle:lines() do
      table.insert(directories, line)
    end
    handle:close()
  else
    vim.notify('Failed to execute fd command', vim.log.levels.ERROR)
  end

  return directories
end

--- Pick a directory then grep in it
function M.grep_in_dir()
  local Snacks = require 'snacks'
  local dirs = get_directories()

  return Snacks.picker {
    finder = function()
      local items = {}
      for i, item in ipairs(dirs) do
        table.insert(items, {
          idx = i,
          file = item,
          text = item,
        })
      end
      return items
    end,
    layout = {
      layout = {
        box = 'horizontal',
        width = 0.5,
        height = 0.5,
        {
          box = 'vertical',
          border = 'rounded',
          title = 'Select directory for grep',
          { win = 'input', height = 1, border = 'bottom' },
          { win = 'list', border = 'none' },
        },
      },
    },
    format = function(item, _)
      local file = item.file
      local ret = {}
      local a = Snacks.picker.util.align
      local icon, icon_hl = Snacks.util.icon 'directory'
      ret[#ret + 1] = { a(icon, 3), icon_hl }
      ret[#ret + 1] = { ' ' }
      ret[#ret + 1] = { a(file, 20) }

      return ret
    end,
    actions = {
      confirm = function(picker)
        local item = picker:current()
        picker:close()
        if item and item.file then
          vim.schedule(function()
            Snacks.picker.grep { cwd = item.file }
          end)
        end
      end,
    },
  }
end

--- Pick a directory then find files in it
function M.files_in_dir()
  local Snacks = require 'snacks'
  local dirs = get_directories()

  return Snacks.picker {
    finder = function()
      local items = {}
      for i, item in ipairs(dirs) do
        table.insert(items, {
          idx = i,
          file = item,
          text = item,
        })
      end
      return items
    end,
    layout = {
      layout = {
        box = 'horizontal',
        width = 0.5,
        height = 0.5,
        {
          box = 'vertical',
          border = 'rounded',
          title = 'Select directory for files',
          { win = 'input', height = 1, border = 'bottom' },
          { win = 'list', border = 'none' },
        },
      },
    },
    format = function(item, _)
      local file = item.file
      local ret = {}
      local a = Snacks.picker.util.align
      local icon, icon_hl = Snacks.util.icon 'directory'
      ret[#ret + 1] = { a(icon, 3), icon_hl }
      ret[#ret + 1] = { ' ' }
      ret[#ret + 1] = { a(file, 20) }

      return ret
    end,
    actions = {
      confirm = function(picker)
        local item = picker:current()
        picker:close()
        if item and item.file then
          vim.schedule(function()
            Snacks.picker.files { cwd = item.file }
          end)
        end
      end,
    },
  }
end

return M
