-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap

map.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- Remove All Text
map.set("n", "<leader>R", "<cmd>%d+<cr>", { desc = "General | Remove All Text", silent = true })
-- Yank All Text
map.set("n", "<leader>Y", "<cmd>%y+<cr>", { desc = "General | Yank All Text", silent = true })
-- Quit
map.set("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "General | Quit", silent = true })
