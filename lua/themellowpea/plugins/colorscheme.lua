local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
}

M.opts = {

  flavour = "mocha",
  transparent_background = true,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = { "italic" },
    keywords = { "italic" },
  },
  integrations = {
    cmp = true,
    dap = true,
    dap_ui = true,
    gitsigns = true,
    mason = true,
    nvimtree = true,
    treesitter = true,
    treesitter_context = true,
    telescope = {
      enabled = true,
    },
    which_key = true,
    nvim_surround = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
}

function M.config()
  vim.cmd.colorscheme("catppuccin-mocha")
end

return M
