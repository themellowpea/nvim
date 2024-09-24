-- set leader key to space
-- anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>no", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "Delete w/o copying into register" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- stay in visual mode on indent
keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

local fn = vim.fn

-- Remove All Text
vim.keymap.set("n", "<leader>R", "<cmd>%d+<cr>", { desc = "General | Remove All Text", silent = true })

-- Yank All Text
vim.keymap.set("n", "<leader>y", "<cmd>%y+<cr>", { desc = "General | Yank All Text", silent = true })

-- Quit
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "General | Quit", silent = true })

-- Toggle Tabufline
vim.keymap.set("n", "<leader>ob", function()
	if vim.o.showtabline == 2 then
		vim.o.showtabline = 0
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Tabufline" })
	else
		vim.o.showtabline = 2
		vim.notify("Toggled On", vim.log.levels.INFO, { title = "Tabufline" })
	end
end, { desc = "Options | Toggle Tabufline", silent = true })

-- Toggle Statusline
vim.keymap.set("n", "<leader>os", function()
	if vim.o.laststatus == 3 then
		vim.o.laststatus = 0
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Statusline" })
	else
		vim.o.laststatus = 3
		vim.notify("Toggled On", vim.log.levels.INFO, { title = "Statusline" })
	end
end, { desc = "Options | Toggle Statusline", silent = true })

-- Toggle Line Number
vim.keymap.set("n", "<leader>ol", function()
	vim.o.number = not vim.o.number
	if vim.o.number then
		vim.notify("Toggled On", vim.log.levels.INFO, { title = "Line Number" })
	else
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Line Number" })
	end
end, { desc = "Options | Toggle Line Number", silent = true })

-- Toggle Relative Number
vim.keymap.set("n", "<leader>or", function()
	vim.o.relativenumber = not vim.o.relativenumber
	if vim.o.relativenumber then
		vim.notify("Toggled On", vim.log.levels.INFO, { title = "Relative Number" })
	else
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Relative Number" })
	end
end, { desc = "Options | Toggle Relative Number", silent = true })

-- Toggle Spell Check
vim.keymap.set("n", "<leader>oS", function()
	vim.wo.spell = not vim.wo.spell
	if vim.wo.spell then
		vim.notify("Toggled On", vim.log.levels.INFO, { title = "Spell Check" })
	else
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Spell Check" })
	end
end, { desc = "Options | Toggle Spell Check", silent = true })

-- Toggle Wrap
vim.keymap.set("n", "<leader>ow", function()
	vim.wo.wrap = not vim.wo.wrap
	if vim.wo.wrap then
		vim.notify("Toggled On", vim.log.levels.INFO, { title = "Line Wrap" })
	else
		vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Line Wrap" })
	end
end, { desc = "Options | Toggle Wrap", silent = true })

-- Better Down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Go to upper window
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "General | Go to upper window", silent = true })

-- Go to lower window
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "General | Go to lower window", silent = true })

-- Go to left window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "General | Go to left window", silent = true })

-- Go to right window
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "General | Go to right window", silent = true })

-- Close window
vim.keymap.set("n", "<leader>w", function()
	if vim.bo.buftype == "terminal" then
		vim.cmd("Bdelete!")
		vim.cmd("silent! close")
	elseif #vim.api.nvim_list_wins() > 1 then
		vim.cmd("silent! close")
	else
		vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
	end
end, { desc = "General | Close window", silent = true })

-- Add size at the top
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "General | Add size at the top", silent = true })

-- Add size at the bottom
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "General | Add size at the bottom", silent = true })

-- Add size at the left
vim.keymap.set(
	"n",
	"<C-Right>",
	"<cmd>vertical resize +2<CR>",
	{ desc = "General | Add size at the left", silent = true }
)

-- Add size at the right
vim.keymap.set(
	"n",
	"<C-Left>",
	"<cmd>vertical resize -2<CR>",
	{ desc = "General | Add size at the right", silent = true }
)

-- Go to previous tab
vim.keymap.set("n", "<Left>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })

-- Go to next tab
vim.keymap.set("n", "<Right>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })

-- New tab
vim.keymap.set("n", "<Up>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })

-- Close tab
vim.keymap.set("n", "<Down>", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

-- Indent backward
vim.keymap.set("n", "<", "<<", { desc = "General | Indent backward", silent = true })

-- Indent forward
vim.keymap.set("n", ">", ">>", { desc = "General | Indent forward", silent = true })

-- Move the line up
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "General | Move the line up", silent = true })

-- Move the line down
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "General | Move the line down", silent = true })

-- Move the line up (Insert Mode)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "General | Move the line up", silent = true })

-- Move the line down (Insert Mode)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "General | Move the line down", silent = true })

-- Better Down (Visual Mode)
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up (Visual Mode)
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Better Paste (Visual Mode)
vim.keymap.set("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })

-- Indent backward (Visual Mode)
vim.keymap.set("v", "<", "<gv", { desc = "General | Indent backward", silent = true })

-- Indent forward (Visual Mode)
vim.keymap.set("v", ">", ">gv", { desc = "General | Indent forward", silent = true })

-- Move the selected text up (Visual Mode)
vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { desc = "General | Move the selected text up", silent = true })

-- Move the selected text down (Visual Mode)
vim.keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { desc = "General | Move the selected text down", silent = true })

-- Enter Normal Mode Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode(Terminal)", silent = true })

-- Go to upper window (Terminal)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-j>", { desc = "General | Go to upper window(Terminal)", silent = true })

-- Go to lower window (Terminal)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-k>", { desc = "General | Go to lower window(Terminal)", silent = true })

-- Go to left window (Terminal)
vim.keymap.set("t", "<C-h>", "<C-\\<C-N><C-h>", { desc = "General | Go to left window(Terminal)", silent = true })

-- Go to right window (Terminal)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-l>", { desc = "General | Go to right window(Terminal)", silent = true })

-- Word Search Increment
vim.keymap.set("c", "<Tab>", function()
	if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
		return "<CR>/<C-r>/"
	end
	return "<C-z>"
end, { desc = "General | Word Search Increment", expr = true })

-- Word Search Decrement
vim.keymap.set("c", "<S-Tab>", function()
	if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
		return "<CR>?<C-r>/"
	end
	return "<S-Tab>"
end, { desc = "General | Word Search Decrement", expr = true })

-- Inspect
vim.keymap.set("n", "<leader>ni", function()
	if vim.version().minor >= 9 then
		vim.cmd("Inspect")
	else
		vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
	end
end, { desc = "Neovim | Inspect", silent = true }) -- only available on neovim >= 0.9

-- Messages
vim.keymap.set("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

-- Health
vim.keymap.set("n", "<leader>nh", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

-- Version
vim.keymap.set("n", "<leader>nv", function()
	local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
	return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
end, { desc = "Neovim | Version", silent = true })

-- Clean
vim.keymap.set("n", "<leader>pc", "<cmd>Lazy clean<cr>", { desc = "Lazy | Clean", silent = true })

-- Check
vim.keymap.set("n", "<leader>pC", "<cmd>Lazy check<cr>", { desc = "Lazy | Check", silent = true })

-- Debug
vim.keymap.set("n", "<leader>pd", "<cmd>Lazy debug<cr>", { desc = "Lazy | Debug", silent = true })

-- Install
vim.keymap.set("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Lazy | Install", silent = true })

-- Sync
vim.keymap.set("n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy | Sync", silent = true })

-- Log
vim.keymap.set("n", "<leader>pl", "<cmd>Lazy log<cr>", { desc = "Lazy | Log", silent = true })

-- Home
vim.keymap.set("n", "<leader>ph", "<cmd>Lazy home<cr>", { desc = "Lazy | Home", silent = true })

-- Help
vim.keymap.set("n", "<leader>pH", "<cmd>Lazy help<cr>", { desc = "Lazy | Help", silent = true })

-- Profile
vim.keymap.set("n", "<leader>pp", "<cmd>Lazy profile<cr>", { desc = "Lazy | Profile", silent = true })

-- Update
vim.keymap.set("n", "<leader>pu", "<cmd>Lazy update<cr>", { desc = "Lazy | Update", silent = true })
