return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'github/copilot.vim', -- Required for Copilot token
    },
    config = function()
      require('codecompanion').setup {
        strategies = {
          chat = {
            adapter = {
              name = 'copilot',
              model = 'gpt-4.1',
            },
          },
          inline = {
            adapter = 'copilot',
            model = 'gpt-4.1',
          },
        },
        opts = {
          log_level = 'ERROR', -- Change to "DEBUG" for troubleshooting
        },
      }
    end,
    keys = {
      {
        '<C-a>',
        '<cmd>CodeCompanionActions<CR>',
        desc = 'Open the action palette',
        mode = { 'n', 'v' },
      },
      {
        '<Leader>a',
        '<cmd>CodeCompanionChat Toggle<CR>',
        desc = 'Toggle a chat buffer',
        mode = { 'n', 'v' },
        -- Leader+a: Toggle the CodeCompanion chat buffer in normal/visual mode
      },
      {
        '<LocalLeader>a',
        '<cmd>CodeCompanionChat Add<CR>',
        desc = 'Add code to a chat buffer',
        mode = { 'v' },
        -- LocalLeader+a: Add selected code to the chat buffer in visual mode
      },
      {
        '<Leader>e',
        '<cmd>CodeCompanionExplain<CR>',
        desc = 'Explain selected code',
        mode = { 'v' },
        -- Leader+e: Explain what is happening in the selected code in visual mode
      },
    },
  },
}
