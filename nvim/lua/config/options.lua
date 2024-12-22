-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.wo.conceallevel = 0
vim.opt.swapfile = false
-- vim.o.timeout = true
-- vim.o.timeoutlen = 500
--r
vim.filetype.add({ extension = { templ = "templ" } })

-- Foldingvim
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.snacks_animate = false
