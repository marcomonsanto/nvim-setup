return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      panel = {
        auto_refresh = false,
        keymap = {
          accept = '<CR>',
          jump_prev = '[[',
          jump_next = ']]',
          refresh = 'gr',
          open = '<M-CR>',
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<D-l>',
          prev = '<D-[>',
          next = '<D-]>',
          dismiss = '<C-]>',
        },
      },
    },
  },
  -- This is done at the init.lua level
  -- {
  --   'saghen/blink.cmp',
  --   optional = true,
  --   dependencies = { 'fang2hou/blink-copilot' },
  --   opts = {
  --     sources = {
  --       default = { 'copilot' },
  --       providers = {
  --         copilot = {
  --           name = 'copilot',
  --           module = 'blink-copilot',
  --           score_offset = 100,
  --           async = true,
  --         },
  --       },
  --     },
  --   },
  -- },
}
