-- NOTE: Completions
return {
  {
    "saghen/blink.cmp",
    dependencies = {
      -- add blink.compat
      {
        "saghen/blink.compat",
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {},
      },
      {
        "hrsh7th/cmp-emoji",
        event = "InsertEnter",
      },
    },

    opts = {
      -- snippets = {
      --   preset = "luasnip",
      -- },
      keymap = {},
      sources = {
        compat = {
          "emoji",
        },
        -- add lazydev to your completion providers
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            score_offset = -3,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = -3, -- show at a higher priority than lsp
          },
        },
      },
    },
  },
}
