local M = {
	"williamboman/mason-lspconfig.nvim",
	event = "BufEnter",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

M.init = function()
	vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason | Installer", silent = true })
end

M.config = function()
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"pyright",
		"bashls",
		"jsonls",
		"gopls",
		"ts_ls",
		"eslint",
		"sqlls",
		"tailwindcss",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
			-- Whether to automatically check for new versions when opening the :Mason window.
			check_outdated_packages_on_open = false,
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = " ",
			},
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})
end

return M
