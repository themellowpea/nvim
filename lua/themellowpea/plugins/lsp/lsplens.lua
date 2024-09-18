-- NOTE: Displaying References and Definition
local M = {
	"VidocqH/lsp-lens.nvim",
	event = "LspAttach",
}

M.init = function()
	vim.keymap.set("n", "<leader>ll", "<cmd>LspLensToggle<cr>", { desc = "LspLens | Toggle Code Lens", silent = true })
end

M.opts = {
	enable = true,
}

return M
