-- NOTE: Treesitter!

local M = {
	"nvim-treesitter/nvim-treesitter",
	cmd = {
		"TSInstall",
		"TSUninstall",
		"TSInstallInfo",
		"TSUpdate",
		"TSBufEnable",
		"TSBufDisable",
		"TSEnable",
		"TSDisable",
		"TSModuleInfo",
		"TSToggle",
		"TSBufToggle",
	},
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	dependencies = {

		"nvim-treesitter/nvim-treesitter-textobjects",

		{
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup()
			end,
			opts = {
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename tags
					enable_close_on_slash = false, -- Auto close on trailing slash
				},
			},
		},

		{
			"nvim-treesitter/nvim-treesitter-context",
			init = function()
				vim.keymap.set(
					"n",
					"<leader>oc",
					"<cmd>TSContextToggle<cr>",
					{ desc = "Treesitter | Toggle Context", silent = true }
				)
				vim.keymap.set("n", "[c", function()
					require("treesitter-context").go_to_context(vim.v.count1)
				end, { desc = "Treesitter | Jumping to context (upwards)", silent = true })
			end,
			opts = {
				enable = false,
			},
		},
	},
}
M.config = function()
	require("nvim-treesitter.configs").setup({
		ignore_install = {},
		sync_install = true,
		auto_install = true,
		-- enable syntax highlighting
		highlight = {
			enable = true,
		},
		-- enable indentation
		indent = { enable = true },
		-- ensure these language parsers are installed
		ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"tsx",
			"regex",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"vimdoc",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"vue",
			"go",
			"cpp",
			"java",
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	})
end

return M
