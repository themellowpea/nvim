-- NOTE: For managing error and warning messages
local M = {
	"folke/trouble.nvim",
	cmd = "Trouble",
}
M.init = function()
	vim.keymap.set(
		"n",
		"<leader>lb",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		{ desc = "Trouble | Buffer Diagnostics", silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>lw",
		"<cmd>Trouble diagnostics toggle<cr>",
		{ desc = "Trouble | Workspace Diagnostics", silent = true }
	)
end

M.opts = {
	focus = true, -- Focus the window when opened
}

return M
