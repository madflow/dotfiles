local theme_setup, theme = pcall(require, "tokyonight")

if not theme_setup then
  return
end

theme.setup({
  style = "night",
  sidebars = {
    "qf",
    "vista_kind",
    "terminal",
    "packer",
    "spectre_panel",
    "NeogitStatus",
    "help",
  },
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
  use_background = true, -- can be light/dark/auto. When auto, background will be set to vim.o.background
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.comment = "#709db2"
    colors.fg_gutter = "#709db2"
    colors.dark5 = "#709db2"
  end,
  on_highlights = function(highlights, colors)
    highlights.CursorLineNr = { bold = true }
  end,
})

local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
