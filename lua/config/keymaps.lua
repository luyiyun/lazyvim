-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here

-- vim.keymap.set("n", "<leader>fs", function()
--   require("persistence").select()
-- end, { desc = "Select Session" })

vim.keymap.set("n", "-", ":noh<cr>", { desc = "remove the search highlight" })
