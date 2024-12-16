return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      vtsls = {
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
    },
  },
}
