return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'folke/snacks.nvim', -- optional - for picker integration
  },
  config = true,
  keys = {
    {
      '<leader>G',
      '<cmd>Neogit<cr>',
      desc = 'Neogit',
    },
  },
}
