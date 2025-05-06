return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
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
