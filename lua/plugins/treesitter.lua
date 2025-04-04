-- NOTE: Treesitter!

local M = {
  "nvim-treesitter/nvim-treesitter",

  dependencies = {

    {
      "windwp/nvim-ts-autotag",
      opts = {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename tags
          enable_close_on_slash = false, -- Auto close on trailing slash
        },
      },
    },
  },
}

M.opts = function(_, opts)
  vim.list_extend(opts.ensure_installed, {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "graphql",
    "gitignore",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "prisma",
    "query",
    "regex",
    "svelte",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
  })
end

return M
