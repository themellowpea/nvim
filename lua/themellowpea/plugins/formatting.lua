-- NOTE: Conform for formatting

local M = {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
}

local opts = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "autopep8" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		go = { "gofumpt", "goimports" },
		cs = { "csharpier" },
		yaml = { "yamlfmt" },
		css = { "prettierd" },
		flow = { "prettierd" },
		graphql = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		javascriptreact = { "prettierd" },
		javascript = { "prettierd" },
		less = { "prettierd" },
		markdown = { "prettierd" },
		scss = { "prettierd" },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		vue = { "prettierd" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
	format_after_save = {
		lsp_format = "fallback",
	},
}

M.config = function()
	local conform = require("conform")
	conform.setup(opts)

	vim.keymap.set({ "n", "v" }, "<leader>F", function()
		conform.format({
			lsp_fallback = true,
			timeout_ms = 500,
		})
	end, { desc = "Conform | Format file or range (in visual mode)" })
end

return M
