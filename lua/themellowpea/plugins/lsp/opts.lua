local M = {}
local keymap = vim.keymap.set
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities()

M.lsp_keymaps = function(bufnr)
	local buf_opts = { buffer = bufnr, silent = true }
	keymap("n", "gD", "<cmd>Lspsaga finder<cr>", { buffer = bufnr, silent = true, desc = "LSP | Finder" })
	keymap(
		"n",
		"gd",
		"<cmd>Lspsaga goto_definition<cr>",
		{ buffer = bufnr, silent = true, desc = "LSP Saga | Go to Definition" }
	)
	keymap(
		"n",
		"gl",
		"<cmd>Lspsaga show_line_diagnostics<cr>",
		{ buffer = bufnr, silent = true, desc = "LSP Saga | Show Line Diagnostics" }
	)
	keymap(
		"n",
		"gp",
		"<cmd>Lspsaga peek_definition<cr>",
		{ buffer = bufnr, silent = true, desc = "LSP Saga | Peek Definition" }
	)
	keymap(
		"n",
		"K",
		"<cmd>Lspsaga hover_doc<cr>",
		{ buffer = bufnr, silent = true, desc = "LSP Saga | Hover Documentaion" }
	)
	keymap(
		"n",
		"gI",
		"<cmd>Telescope lsp_implementations<cr>",
		{ buffer = bufnr, silent = true, desc = "Telescope | See Implementations" }
	)
end

-- Highlight symbol under cursor
M.lsp_highlight = function(client, bufnr)
	if client.supports_method("textDocument/documentHighlight") then
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

M.on_attach = function(client, bufnr)
	M.lsp_keymaps(bufnr)
	M.lsp_highlight(client, bufnr)
end

M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

return M
