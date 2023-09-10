return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = {
  --     style = "storm",
  --     on_colors = function(colors)
  --       colors.fg_gutter = "#707cb2"
  --       colors.comment = "#709db2"
  --       colors.dark5 = "#709db2"
  --     end,
  --     on_highlights = function(hl, c)
  --       hl.DiagnosticUnnecessary = {
  --         fg = c.comment,
  --       }
  --     end,
  --   },
  -- },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    build = ":NightfoxCompile",
    opts = {
      palettes = {
        nordfox = {},
      },
    },
  },
  -- {
  --   "sainnhe/everforest",
  --   lazy = true,
  -- },
  -- { "navarasu/onedark.nvim", lazy = true },
  -- {
  --   "catppuccin/nvim",
  --   lazy = true,
  --   name = "catppuccin",
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordfox",
    },
  },
}
