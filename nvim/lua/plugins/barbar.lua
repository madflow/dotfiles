local setup, bufferline = pcall(require, "bufferline")
if not setup then
  return
end

bufferline.setup({
  animation = false,
  icon_separator_active = "",
  icon_separator_inactive = "",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "NvimTree" then
      require("bufferline.api").set_offset(31, "File Explorer")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    if vim.fn.expand("<afile>"):match("NvimTree") then
      require("bufferline.api").set_offset(0)
    end
  end,
})

-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- Move to previous/next
-- map("n", "<C-,>", "<Cmd>BufferPrevious<CR>", opts)
-- map("n", "<C-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
-- map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
-- map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
-- map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
-- map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
-- map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
-- map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
-- map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
-- map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
-- map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
-- map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
-- map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
-- map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
-- map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
-- map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
-- map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
-- map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
-- map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
-- map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
