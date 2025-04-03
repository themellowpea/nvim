return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local servers = {
        "bashls",
        "cssls",
        "eslint",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "sqlls",
        "tailwindcss",
        "ts_ls",
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "yamlfmt",
        "stylua",
        "shellcheck",
        "shfmt",
        "prettier",
        "prettierd",
        "goimports",
        "gofumpt",
        "flake8",
        "eslint_d",
      },
    },
  },
}
