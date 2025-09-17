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
          accept = '<Tab>',
          prev = '<D-[>',
          next = '<D-]>',
          dismiss = '<C-]>',
        },
      },
    },
  },
}
