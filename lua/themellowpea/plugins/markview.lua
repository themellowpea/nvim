-- NOTE: Better Markdown
local M = {
	"OXY2DEV/markview.nvim",
	ft = "markdown", -- If you decide to lazy-load anyway
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
local icons = require("themellowpea.utils.icons")
M.config = function()
	require("markview").setup({
		checkboxes = {
			checked = {
				text = icons.ui.Check,
			},
			unchecked = {
				text = icons.ui.Close,
				hl = "CheckboxUnchecked",
			},
			pending = {
				text = icons.misc.Watch,
				hl = "CheckboxProgress",
			},
			custom = {
				{
					match = "!",
					text = icons.diagnostics.Error,
					hl = "CheckboxUnchecked",
				},
				{
					match = ">",
					text = icons.diagnostics.Question,
					hl = "CheckboxPending",
				},
				{
					match = "~",
					text = icons.misc.Watch,
					hl = "CheckboxProgress",
				},
			},
		},
	})
end

return M
