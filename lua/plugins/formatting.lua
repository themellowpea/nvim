return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        cs = { "csharpier" },
        css = { "prettierd" },
        flow = { "prettierd" },
        go = { "gofumpt", "goimports" },
        graphql = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        json = { "prettierd" },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        python = { "autopep8" },
        scss = { "prettierd" },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd" },
        yaml = { "yamlfmt" },
      },
    },
  },
}
