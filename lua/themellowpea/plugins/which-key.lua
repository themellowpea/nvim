-- NOTE: Keymaps Popup/Guide
local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

local icons = require("themellowpea.utils.icons")
M.opts = {
	icons = {
		breadcrumb = icons.ui.DividerRight, -- symbol used in the command line area that shows your active key combo
		separator = icons.ui.ChevronShortRight, -- symbol used between a key and it's label
		group = "", -- symbol prepended to a group
	},
	preset = "modern",
	win = {
		border = vim.g.border_enabled and "rounded" or "none",
	},
	delay = function()
		return 0
	end,
}

M.config = function(_, opts)
	require("which-key").setup(opts)
	require("which-key").add({
		{
			{ "<leader>e", group = "Nvim Tree", icon = icons.ui.Tree },
			{ "<leader>s", group = "Window Split", icon = icons.ui.Code },
			{ "<leader>T", group = "Tests", icon = icons.ui.Scopes },
			{ "<leader>d", group = "Debugging", icon = icons.ui.Bug },
			{ "<leader>f", group = "Find", icon = icons.ui.Telescope },
			{ "<leader>g", group = "Git", icon = icons.git.Branch },
			{ "<leader>h", group = "Harpoon", icon = icons.ui.Pencil },
			{ "<leader>l", group = "LSP", icon = icons.ui.Lightbulb },
			{ "<leader>n", group = "Neovim", icon = icons.ui.NeoVim },
			{ "<leader>o", group = "Options", icon = icons.ui.Gear },
			{ "<leader>p", group = "Plugins", icon = icons.ui.Package },
			{ "<leader>t", group = "Tabs", icon = icons.ui.Code },
		},
	})
end

return M
