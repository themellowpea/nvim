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
    "json",
    "javascript",
    "typescript",
    "tsx",
    "regex",
    "yaml",
    "html",
    "css",
    "prisma",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "vimdoc",
    "dockerfile",
    "gitignore",
    "query",
    "vimdoc",
    "c",
    "vue",
    "go",
    "cpp",
    "java",
  })
end

return M
