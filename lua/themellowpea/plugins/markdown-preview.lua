-- NOTE: Preview Markdown
local M = {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
}

M.init = function()
	vim.keymap.set("n", "<leader>m", function()
		if vim.bo.filetype == "markdown" then
			vim.cmd("MarkdownPreviewToggle")
		else
			vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Preview" })
		end
	end, { desc = "Markdown Preview", silent = true })
end

M.build = function()
	require("lazy").load({ plugins = { "markdown-preview.nvim" } })
	vim.fn["mkdp#util#install"]()
end

return M
