-- NOTE: Default Plugins

return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	-- Schemas
	{ "b0o/schemastore.nvim" },
	-- Buffer Delete
	{
		"moll/vim-bbye",
		cmd = { "Bdelete", "Bwipeout" },
	},
	-- Add Luarocks support for lazy.nvim
	-- {
	-- 	"vhyrro/luarocks.nvim",
	-- 	priority = 1001,
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		rocks = {
	-- 			"magick",
	-- 		},
	-- 	},
	-- },
}
