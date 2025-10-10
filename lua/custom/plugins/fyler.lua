return {
  'A7Lavinraj/fyler.nvim',
  -- dependencies = { 'nvim-mini/mini.icons' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  branch = 'stable',
  opts = {
    icon_provider = 'nvim_web_devicons',
    views = {
      explorer = {
        default_explorer = true,
      },
    },
  },
  keys = {
    {
      '<C-b>',
      function()
        local fyler = require 'fyler'
        fyler.open { kind = 'split_left_most' }
      end,
      desc = 'Explorer Fyler',
    },
  },
}
