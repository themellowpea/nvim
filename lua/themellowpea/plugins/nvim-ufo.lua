-- NOTE: Improve Folds

local M = {
  "kevinhwang91/nvim-ufo",
  event = "BufReadPost",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        local builtin = require "statuscol.builtin"
        require("statuscol").setup {
          relculright = true,
          segments = {
            { text = { builtin.foldfunc, "  " },     click = "v:lua.ScFa" },
            -- { sign = { namespace = { "diagnostic" } } },
            { text = { " ", builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            { text = { "%s" },                       click = "v:lua.ScSa" },
            -- {
            --   sign = {
            --     name = { "GitSigns*" },
            --     namespace = { "gitsigns" },
            --     colwidth = 1,
            --   },
            --   click = "v:lua.ScSa",
            -- },
          },
        }
      end,
    },
  },
}


M.init = function()
  vim.o.foldcolumn = "1"
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
end

M.opts = {
  provider_selector = function(_, _, _)
    return { "treesitter", "indent" }
  end,
}

return M

