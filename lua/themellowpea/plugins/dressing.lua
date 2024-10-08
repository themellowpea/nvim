-- NOTE: Improve UI

local M = {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
}

M.opts = {
  input = {
    enabled = true,
    default_prompt = "➤ ",
    win_options = {
      winblend = 0,
    },
  },
  select = {
    enabled = true,
    backend = { "telescope", "builtin" },
    builtin = {
      win_options = {
        winblend = 0,
      },
    },
  },
}

return M
