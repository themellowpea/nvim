-- NOTE: Show diffs

local M = {
  "sindrets/diffview.nvim",
  event = "BufReadPost",
}

M.init = function()
  vim.keymap.set("n", "<leader>gd", function()
    if next(require("diffview.lib").views) == nil then
      vim.cmd "DiffviewOpen"
    else
      vim.cmd "DiffviewClose"
    end
  end, { desc = "Diffview | Toggle Diffview", silent = true })
end

return M
