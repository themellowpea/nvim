-- NOTE: Markdown stuff

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = true,
      },
      heading = {
        sign = true,
      },
      checkbox = {
        enabled = true,
        right_pad = 1,
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    ft = "markdown", -- If you decide to lazy-load anyway
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local icons = require("icons")
      require("markview").setup({
        checkboxes = {
          checked = {
            text = icons.ui.Check,
          },
          unchecked = {
            text = icons.ui.Close,
            hl = "CheckboxUnchecked",
          },
          pending = {
            text = icons.misc.Watch,
            hl = "CheckboxProgress",
          },
          custom = {
            {
              match = "!",
              text = icons.diagnostics.Error,
              hl = "CheckboxUnchecked",
            },
            {
              match = ">",
              text = icons.diagnostics.Question,
              hl = "CheckboxPending",
            },
            {
              match = "~",
              text = icons.misc.Watch,
              hl = "CheckboxProgress",
            },
          },
        },
      })
    end,
  },
}
