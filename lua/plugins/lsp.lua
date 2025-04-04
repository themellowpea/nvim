return {
  -- Mason
  -- add servers here
  {
    "williamboman/mason.nvim",
    opts = function()
      return {
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
      }
    end,
  },
}
