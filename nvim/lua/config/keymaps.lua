-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local fn = vim.fn

-- Easy insertion of a trailing ; or , from insert mode
keymap.set("i", ";;", "<Esc>A;<Esc>")
keymap.set("i", ",,", "<Esc>A,<Esc>")

--- Hoping around
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

--- Bufferline
keymap.set("n", "<C-p>", "<Cmd>BufferLinePick<CR>")

for _, mode in pairs({ "n", "i", "v", "x" }) do
  for _, key in pairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
    keymap.set(mode, key, "<nop>")
  end
end

keymap.set("n", "<F5>", function()
  require("dap").continue()
end)
keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)
keymap.set("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end)
keymap.set("n", "<Leader>B", function()
  require("dap").set_breakpoint()
end)
keymap.set("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, fn.input("Log point message: "))
end)
keymap.set("n", "<Leader>dr", function()
  require("dap").repl.open()
end)
keymap.set("n", "<Leader>dl", function()
  require("dap").run_last()
end)
keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)
keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)
keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
