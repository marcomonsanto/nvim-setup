return {
  'ThePrimeagen/harpoon',
  config = function()
    require('telescope').setup {}
    local ui = require 'harpoon.ui'
    local mark = require 'harpoon.mark'

    vim.keymap.set('n', '<leader>hl', ui.toggle_quick_menu, { desc = '[H]arpoon [L]ist' })
    vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = '[H]arpoon [A]dd' })
    vim.keymap.set('n', '<leader>hc', mark.clear_all, { desc = '[H]arpoon [C]lear' })
  end,
}
