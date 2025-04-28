return {
  {
    'yetone/avante.nvim',
    lazy = true,
    event = 'VeryLazy',
    build = 'make',

    opts = {
      provider = 'copilot',
      auto_suggestions_provider = 'copilot',
      copilot = {
        model = 'claude-3.5-sonnet', -- Best balance of quality and speed
        temperature = 0, -- 0 for deterministic responses
        max_tokens = 8192, -- High token limit for longer responses
        timeout = 60000, -- 60 seconds timeout for network operations
        proxy = nil, -- Set to your proxy URL if needed
        allow_insecure = false, -- Set to true only if you need to bypass SSL verification
        disable_tools = {
          'rag_search',
          'python',
          'create_file',
          'rename_file',
          'delete_file',
          'create_dir',
          'rename_dir',
          'delete_dir',
        },
        code_editing_commands = true, -- Enable code editing commands
        telemetry = false, -- Disable telemetry for privacy
        split_threshold = 1024, -- Split large messages at this character count
      },
      hints = { enabled = true },
      file_selector = {
        provider = 'snacks',
        provider_opts = {},
      },
      behaviour = {
        -- enable_cursor_planning_mode = true,
        auto_suggestions = true,
        use_cwd_as_project_root = true,
      },
      mappings = {
        suggestion = {
          accept = '<Tab>',
        },
      },
      suggestion = {
        debounce = 500,
        throttle = 500,
      },
    },

    dependencies = {
      {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = function(_, ft)
          vim.list_extend(ft, { 'Avante' })
        end,
      },
      {
        'folke/which-key.nvim',
        opts = {
          spec = {
            { '<leader>a', group = 'ai' },
          },
        },
      },
    },
  },
  {
    'stevearc/dressing.nvim',
    lazy = true,
    opts = {
      input = { enabled = false },
      select = { enabled = false },
    },
  },
  {
    'saghen/blink.compat',
    lazy = true,
    opts = {},
    config = function()
      -- monkeypatch cmp.ConfirmBehavior for Avante
      require('cmp').ConfirmBehavior = {
        Insert = 'insert',
        Replace = 'replace',
      }
    end,
  },
  {
    'saghen/blink.cmp',
    lazy = true,
    opts = {
      sources = {
        default = { 'avante_commands', 'avante_mentions', 'avante_files' },
        providers = {
          avante_commands = {
            name = 'avante_commands',
            module = 'blink.compat.source',
            score_offset = 90, -- show at a higher priority than lsp
            opts = {},
          },
          avante_files = {
            name = 'avante_files',
            module = 'blink.compat.source',
            score_offset = 100, -- show at a higher priority than lsp
            opts = {},
          },
          avante_mentions = {
            name = 'avante_mentions',
            module = 'blink.compat.source',
            score_offset = 1000, -- show at a higher priority than lsp
            opts = {},
          },
        },
      },
    },
  },
}
