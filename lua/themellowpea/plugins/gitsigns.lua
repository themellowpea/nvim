-- NOTE: Git Signs
local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
}

local icons = require("themellowpea.utils.icons")

M.opts = {
	signs = {
		add = {
			text = icons.ui.BoldLineMiddle,
		},
		change = {
			text = icons.ui.BoldLineDashedMiddle,
		},
		delete = {
			text = icons.ui.TriangleShortArrowRight,
		},
		topdelete = {
			text = icons.ui.TriangleShortArrowRight,
		},
		changedelete = {
			text = icons.ui.BoldLineMiddle,
		},
	},

	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},

	attach_to_untracked = true,
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	update_debounce = 200,
	max_file_length = 40000,
	preview_config = {
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},

	on_attach = function() end,
}

M.init = function()
	vim.keymap.set(
		"n",
		"<leader>gp",
		"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
		{ desc = "Gitsigns | Preview Hunk", silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>gj",
		"<cmd>lua require 'gitsigns'.next_hunk()<cr>",
		{ desc = "Gitsigns | Next Hunk", silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>gk",
		"<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
		{ desc = "Gitsigns | Prev Hunk", silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>gl",
		"<cmd>lua require 'gitsigns'.blame_line()<cr>",
		{ desc = "Gitsigns | Blame Line", silent = true }
	)
end

return M
