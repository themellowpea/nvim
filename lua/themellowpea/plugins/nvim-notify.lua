-- NOTE: Notification
local M = {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
}

M.opts = {
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade",
  timeout = 3000,
  top_down = false,
}

M.config = function(_, opts)
  require("notify").setup(opts)

  vim.notify = require "notify"
end

return M
