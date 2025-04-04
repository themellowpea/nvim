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
    },

    opts = {

      snippets = {
        preset = "luasnip",
      },

      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- show at a higher priority than lsp
          },
        },
      },

      cmdline = {
        enabled = true,
      },
    },
  },
}
