return {
  'CopilotC-Nvim/CopilotChat.nvim',
  enabled = true,
  dependencies = {
    { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
    { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    window = {
      layout = 'horizontal', -- or 'vertical'
    },
  },
  keys = {
    { '<leader>ae', '<cmd>CopilotChatExplain<cr>', desc = 'CopilotChat - Explain code' },
    { '<leader>at', '<cmd>CopilotChatTests<cr>', desc = 'CopilotChat - Generate tests' },
    { '<leader>ar', '<cmd>CopilotChatReview<cr>', desc = 'CopilotChat - Review code' },
    { '<leader>aR', '<cmd>CopilotChatRefactor<cr>', desc = 'CopilotChat - Refactor code' },
    { '<leader>an', '<cmd>CopilotChatBetterNamings<cr>', desc = 'CopilotChat - Better Naming' },
    -- Chat with Copilot in visual mode
    {
      '<leader>av',
      '<cmd>CopilotChatVisual',
      mode = 'x',
      desc = 'CopilotChat - Open in horizontal split',
    },
    {
      '<leader>ax',
      ':CopilotChatInline<cr>',
      mode = 'x',
      desc = 'CopilotChat - Inline chat',
    },
    -- Custom input for CopilotChat
    {
      '<leader>ai',
      function()
        local input = vim.fn.input 'Ask Copilot: '
        if input ~= '' then
          vim.cmd('CopilotChat ' .. input)
        end
      end,
      desc = 'CopilotChat - Ask input',
    },
    -- Generate commit message based on the git diff
    {
      '<leader>am',
      '<cmd>CopilotChatCommit<cr>',
      desc = 'CopilotChat - Generate commit message for all changes',
    },
    -- Quick chat with Copilot
    {
      '<leader>aq',
      function()
        local input = vim.fn.input 'Quick Chat: '
        if input ~= '' then
          require('CopilotChat').ask(input, { context = 'buffers' })
        end
      end,
      desc = 'CopilotChat - Quick chat',
    },
  },
  -- See Commands section for default commands if you want to lazy load on them
}
