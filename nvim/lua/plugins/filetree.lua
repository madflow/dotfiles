return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".git",
        },
        never_show_by_pattern = { -- uses glob style patterns
          ".null-ls_*",
        },
      },
      follow_current_file = true,
    }
  end,
}
