return {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').setup {
      bold_keywords = true,
      italic_comments = true,
      swap_backgrounds = true,
      bright_border = true,
      reduced_blue = true,
      transparent = {
        -- Enable transparent background.
        bg = true,
        -- Enable transparent background for floating windows.
        float = true,
      },
      -- on_palette = function(palette)
      --   palette.black0 = '#BF616A'
      --
      --   palette.orange = {
      --     base = '#EBAE80',
      --     bright = '#E8BFA6',
      --     dim = '#E7B19C',
      --   }
      --   palette.green = {
      --     base = '#B4D2A6',
      --     bright = '#C4D7B5',
      --     dim = '#A2C4A1',
      --   }
      --   palette.magenta = {
      --     base = '#B4D2A6',
      --     bright = '#E1B3D1',
      --     dim = '#A2C4A1',
      --   }
      --
      --   palette.orange = '#DB9E6D'
      --   palette.cyan = '#A0D0D7'
      --   palette.green = '#B4D2A6'
      --   -- palette.green.base = palette.cyan.base
      --   return palette
      -- end,
      -- override = {
      --   PmenuSel = { bg = '#CB775D' },
      --   Visual = {
      --     bg = '#574640', -- Choose a color you like.,
      --   },
      --   CursorLineNr = {
      --     fg = '#D08770',
      --     bold = true,
      --   },
      -- },
    }
    require('nordic').load {
      on_highlight = function(highlights, palette)
        highlights.PmenuSel = { bg = '#CB775D' }
        highlights.Visual = {
          bg = '#CB775D', -- Choose a color you like.,
        }
        highlights.CursorLineNr = {
          fg = '#D08770',
          bold = true,
        }
      end,
    }
    vim.cmd.colorscheme 'nordic'
  end,
}
