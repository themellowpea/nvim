local M = {
  "neovim/nvim-lspconfig",
}

---@class PluginLspOpts
M.opts = {
  servers = {
    lua_ls = {},
    cssls = {},
    html = {},
    pyright = {},
    bashls = {},
    jsonls = {},
    gopls = {},
    ts_ls = {},
    eslint = {},
    sqlls = {},
    tailwindcss = {},
    jdtls = {},
  },
}

local N = {
  "VidocqH/lsp-lens.nvim",
}
return { M, N }
