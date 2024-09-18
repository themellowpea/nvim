-- NOTE: Find And Replace
local M = {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
}

M.init = function()
  vim.keymap.set("n", "<leader>fR", "<cmd>GrugFar<cr>", { desc = "GrugFar | Find And Replace", silent = true })
end

M.opts = {}

return M
