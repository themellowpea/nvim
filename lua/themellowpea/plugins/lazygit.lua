-- NOTE: LazyGit

local M = {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
}

-- setting the keybinding for LazyGit with 'keys' is recommended in
-- order to load the plugin when the command is run for the first time
M.keys = {
	{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit | Open LazyGit" },
}

return M
