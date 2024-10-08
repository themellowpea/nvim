local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/neodev.nvim",
			ft = { "lua" },
		},
	},
	cmd = { "LspInfo", "LspInstall", "LspStart" },
}

local icons = require("themellowpea.utils.icons")
local on_init = require("themellowpea.plugins.lsp.opts").on_init
local capabilities = require("themellowpea.plugins.lsp.opts").capabilities

local lsp_keymaps = require("themellowpea.plugins.lsp.opts").lsp_keymaps
local lsp_highlight = require("themellowpea.plugins.lsp.opts").lsp_highlight
local on_attach = function(client, bufnr)
	local signs = {
		Error = icons.diagnostics.Error,
		Warn = icons.diagnostics.Warning,
		Hint = icons.diagnostics.Hint,
		Info = icons.diagnostics.Information,
	}

	local default_diagnostic_config = {
		virtual_text = false,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	if vim.version().minor >= 11 then
		default_diagnostic_config.signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
				[vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
				[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
				[vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
			},
			linehl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
				[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
				[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			},
		}
	else
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
		default_diagnostic_config.signs = { active = signs }
	end

	-- Set diagnostics and keymaps only if they are not already set
	if not vim.b[bufnr].lsp_keymaps_set then
		lsp_keymaps(bufnr)
		vim.b[bufnr].lsp_keymaps_set = true
	end

	lsp_highlight(client, bufnr)
	vim.diagnostic.config(default_diagnostic_config)
end

M.config = function()
	local lspconfig = require("lspconfig")
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
		"jdtls",
	}

	require("java").setup()

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	require("lspconfig.ui.windows").default_options.border = "rounded"

	for _, server in pairs(servers) do
		local opts = {
			on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
		}

		local require_ok, settings = pcall(require, "themellowpea.lsp.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		if server == "lua_ls" then
			require("neodev").setup({})
		end

		if server == "jdtls" then
			lspconfig["jdtls"].setup({})
		end

		lspconfig[server].setup(opts)
	end
end

return M
