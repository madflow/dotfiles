return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "xiyaowong/telescope-emoji.nvim" },
  opts = function()
    require("telescope").load_extension("emoji")
  end,
}
