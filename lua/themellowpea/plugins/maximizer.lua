local M = {
  "szw/vim-maximizer",
  -- will lazy load when the following keys are triggered
}

M.keys = {
  { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
}

return M
