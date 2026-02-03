return {
  -- Mason
  -- add servers here
  {
    "mason-org/mason.nvim",
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
