-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local g = vim.g

-- LazyVim autoformat
g.autoformat = true

local opt = vim.opt

-- so that `` is visible in markdown files
opt.conceallevel = 1

vim.g.lazyvim_blink_main = false
