local M = {
  "epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
}
M.opts = {
  conceallevel = 2,
  workspaces = {
    {
      name = "themellowpea_1_0",
      path = "~/obsidian/themellowpea_1_0/",
    },
  },

  templates = {
    folder = "~/obsidian/themellowpea_1_0/templates/",
    date_format = "%Y-%m-%d",
    time_format = "%Y-%m-%d-%H:%M",
  },

  notes_subdir = "inbox/",

  -- Where to put new notes. Valid options are
  --  * "current_dir" - put new notes in same directory as the current buffer.
  --  * "notes_subdir" - put new notes in the default notes subdirectory.
  new_notes_location = "notes_subdir",

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "inbox/daily_notes",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "daily_note_template.md",
  },

  attachments = {
    -- The default folder to place images in via `:ObsidianPasteImg`.
    -- If this is a relative path it will be interpreted as relative to the vault root.
    -- You can always override this per image by passing a full path to the command instead of just a filename.
    img_folder = "resources/attachments",
  },
  -- Optional, customize how note file names are generated given the ID, target directory, and title.
  ---@param spec { id: string, dir: obsidian.Path, title: string|? }
  ---@return string|obsidian.Path The full path to the new note.
  note_path_func = function(spec)
    -- This is equivalent to the default behavior.
    local path = spec.dir / tostring(spec.title)
    return path:with_suffix(".md")
  end,
}

return M
