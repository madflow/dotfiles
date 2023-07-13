-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds her

local function augroup(name)
  return vim.api.nvim_create_augroup("local_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("php"),
  pattern = { "php" },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.autoindent = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("make"),
  pattern = { "make" },
  callback = function()
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 8
    vim.opt.softtabstop = 0
  end,
})
