return {
  'A7Lavinraj/fyler.nvim',
  dependencies = { 'nvim-mini/mini.icons' },
  branch = 'stable',
  opts = {
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
