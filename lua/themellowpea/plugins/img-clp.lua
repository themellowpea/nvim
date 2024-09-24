local M = {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
}

M.opts = {}

M.keys = {
	-- suggested keymap
	{ "<leader>pP", "<cmd>PasteImage<cr>", desc = "Img Clip | Paste image from system clipboard" },
}

return M
