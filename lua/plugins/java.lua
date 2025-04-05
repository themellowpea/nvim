-- NOTE: Java

return {
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
  },
  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            -- mason = false, -- set to false if you don't want this server to be installed with mason
            -- Use this to add any additional keymaps
            -- for specific lsp servers
            ---@type LazyKeysSpec[]
            -- keys = {},
            jdtls = {
              settings = {
                java = {
                  inlayHints = {
                    parameterNames = {
                      enabled = "all",
                    },
                  },
                  configuration = {
                    runtimes = {
                      {
                        name = "JavaSE-21",
                        path = "/Users/themellowpea/.sdkman/candidates/java/21.0.6-tem",
                      },
                    },
                  },
                },
              },
            },
          },

          setup = {
            jdtls = function()
              require("java").setup({
                verification = {
                  -- invalid_order = false,
                  -- duplicate_setup_calls = false,
                  -- invalid_mason_registry = true,
                },
                root_markers = {
                  "settings.gradle",
                  "settings.gradle.kts",
                  "pom.xml",
                  "build.gradle",
                  "mvnw",
                  "gradlew",
                  "build.gradle",
                  "build.gradle.kts",
                },
              })
            end,
          },
        },
      },
    },
  },
}
