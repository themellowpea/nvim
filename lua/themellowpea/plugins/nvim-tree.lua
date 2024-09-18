-- NOTE: File Explorer

local M = {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
}

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
end

local function renderer()
	local icons = require("themellowpea.utils.icons")
	return {
		root_folder_label = ":~:s?$?",
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},

			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			glyphs = {
				default = icons.ui.Text,
				symlink = icons.ui.FileSymlink,
				bookmark = icons.ui.BookMark,
				folder = {
					arrow_closed = icons.ui.ChevronRight,
					arrow_open = icons.ui.ChevronShortDown,
					default = icons.ui.Folder,
					open = icons.ui.FolderOpen,
					empty = icons.ui.EmptyFolder,
					empty_open = icons.ui.EmptyFolderOpen,
					symlink = icons.ui.FolderSymlink,
					symlink_open = icons.ui.FolderOpen,
				},
				git = {
					unstaged = icons.git.FileUnstaged,
					staged = icons.git.FileStaged,
					unmerged = icons.git.FileUnmerged,
					renamed = icons.git.FileRenamed,
					untracked = icons.git.FileUntracked,
					deleted = icons.git.FileDeleted,
					ignored = icons.git.FileIgnored,
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	}
end

M.init = function()
	vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTree | Explorer", silent = true })
	vim.keymap.set(
		"n",
		"<leader>ef",
		"<cmd>NvimTreeFindFileToggle<CR>",
		{ desc = "NvimTree | Toggle file explorer on current file" }
	) -- toggle file explorer on current file
	vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "NvimTree | Collapse file explorer" }) -- collapse file explorer
	vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "NvimTree | Refresh file explorer" }) -- refresh file explorer
end

M.cmd = {
	"NvimTreeOpen",
	"NvimTreeToggle",
	"NvimTreeFocus",
	"NvimTreeFindFile",
	"NvimTreeFindFileToggle",
}

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too

M.opts = {
	on_attach = on_attach,
	diagnostics = {
		enable = true,
		icons = {
			hint = "󰌵",
			info = "",
			warning = "",
			error = "",
		},
	},
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 5000,
	},
	view = {
		relativenumber = true,
		cursorline = true,
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
	},

	renderer = renderer(),
}

return M
