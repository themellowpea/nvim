-- NOTE: Commenter

local M = {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	event = "BufEnter",
}

M.config = function()
	-- import comment plugin safely
	local comment = require("Comment")

	local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

	-- enable comment
	comment.setup({
		-- ignores empty lines
		ignore = "^$",
		-- for commenting tsx, jsx, svelte, html files
		pre_hook = ts_context_commentstring.create_pre_hook(),
		padding = true,
		sticky = true,
		mappings = false,
		opleader = {
			---Line-comment keymap
			line = "gc",
			---Block-comment keymap
			block = "gb",
		},
		toggler = {
			---Line-comment toggle keymap
			line = "gcc",
			---Block-comment toggle keymap
			block = "gbc",
		},
		post_hook = function() end,
		extra = {
			---Add comment on the line above
			above = "gcO",
			---Add comment on the line below
			below = "gco",
			---Add comment at the end of line
			eol = "gcA",
		},
	})
end

return M
