-- NOTE: Linting

local M = {
	"mfussenegger/nvim-lint",
	event = "BufReadPost",
}
M.config = function()
	require("lint").linters_by_ft = {
		-- python = { "flake8" },
		-- ghaction = { "actionlint" },
	}

	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end

return M
