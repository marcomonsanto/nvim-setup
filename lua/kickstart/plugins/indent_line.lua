return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      scope = { enabled = true, show_exact_scope = true, highlight = { 'Function', 'Label' } },
      indent = { char = '│' },
    },
    -- opts = {
    --   scope = { char = '│', highlight = 'Function' },
    -- },
  },
}
