return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Enable picker module (replaces Telescope)
    picker = {
      enabled = true,
      -- Use filename first display (matches your previous telescope config)
      formatters = {
        file = {
          filename_first = true,
        },
      },
      -- Match your telescope ignore patterns
      win = {
        input = {
          keys = {
            -- Use normal mode mappings for better navigation
            ['<C-j>'] = { 'list_down', mode = { 'i', 'n' } },
            ['<C-k>'] = { 'list_up', mode = { 'i', 'n' } },
          },
        },
      },
    },
    -- Enable notification system for better UI feedback
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    -- Enable smooth scrolling for better UX
    scroll = {
      enabled = false,
      animate = {
        duration = { step = 15, total = 250 },
      },
    },
    -- Enable terminal integration
    terminal = {
      enabled = true,
    },
    -- Quickfile for faster file opening
    quickfile = {
      enabled = true,
    },
    -- Statuscolumn improvements
    statuscolumn = {
      enabled = true,
    },
    -- Word highlighting
    words = {
      enabled = true,
    },
    -- Git integration
    git = {
      enabled = true,
    },
    -- Indent guides
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      },
    },
    -- Scope highlighting
    scope = {
      enabled = true,
    },
  },
  keys = {
    -- File pickers
    {
      '<leader>sf',
      function()
        Snacks.picker.files()
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>s.',
      function()
        Snacks.picker.recent()
      end,
      desc = '[S]earch Recent Files ("." for repeat)',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[ ] Find existing buffers',
    },

    -- Search pickers
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.lines()
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>s/',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = '[S]earch [/] in Open Files',
    },

    -- Utility pickers
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>st',
      function()
        Snacks.picker.pickers()
      end,
      desc = '[S]earch [S]elect Telescope',
    },

    -- Git pickers
    {
      '<leader>sc',
      function()
        Snacks.picker.git_status()
      end,
      desc = '[S]earch by [C]hanges',
    },
    {
      '<leader>gc',
      function()
        Snacks.picker.git_log()
      end,
      desc = '[G]it [C]ommits',
    },
    {
      '<leader>gbc',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = '[G]it [B]uffer [C]ommits',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = '[G]it [S]tatus',
    },

    -- Directory-scoped searches with visual picker
    {
      '<leader>sDg',
      function()
        -- Browse with explorer first, then grep in selected directory
        require('custom.dir-picker').grep_in_dir()
      end,
      desc = '[S]earch in [D]irectory [G]rep',
    },
    {
      '<leader>sDf',
      function()
        -- Browse with explorer first, then find files in selected directory
        require('custom.dir-picker').files_in_dir()
      end,
      desc = '[S]earch in [D]irectory [F]iles',
    },

    -- Neovim config files
    {
      '<leader>sn',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch [N]eovim files',
    },

    -- Additional QoL pickers
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = '[S]earch [M]arks',
    },
    {
      '<leader>sj',
      function()
        Snacks.picker.jumps()
      end,
      desc = '[S]earch [J]umps',
    },
    {
      '<leader>sC',
      function()
        Snacks.picker.command_history()
      end,
      desc = '[S]earch [C]ommand history',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.lines()
      end,
      desc = '[/] Search in current buffer',
    },

    -- Git branches
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = '[G]it [B]ranches',
    },

    -- Git stash (using terminal for now - can be customized)
    {
      '<leader>gS',
      function()
        Snacks.terminal 'git stash list --pretty=format:"%gd: %gs" | fzf --preview "git stash show -p {1}" | cut -d: -f1 | xargs git stash pop'
      end,
      desc = '[G]it [S]tash',
    },

    -- Terminal toggle
    {
      '<c-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
      mode = { 'n', 't' },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for easier access
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        -- Create some toggle commands
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>ts'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>tw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tL'
        Snacks.toggle.diagnostics():map '<leader>td'
        Snacks.toggle.line_number():map '<leader>tl'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>tc'
        Snacks.toggle.treesitter():map '<leader>tT'
        Snacks.toggle.inlay_hints():map '<leader>th'
      end,
    })
  end,
}
