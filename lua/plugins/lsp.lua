-- since this is just an example spec, don't actually load anything here and return an empty spec
-- 删除stylua ignore来让lsp生效

-- local servers_lua = {
--   -- mason = false, -- set to false if you don't want this server to be installed with mason
--   -- Use this to add any additional keymaps
--   -- for specific lsp servers
--   -- ---@type LazyKeysSpec[]
--   -- keys = {},
--   settings = {
--     Lua = {
--       workspace = {
--         checkThirdParty = false,
--       },
--       codeLens = {
--         enable = true,
--       },
--       completion = {
--         callSnippet = "Replace",
--       },
--       doc = {
--         privateName = { "^_" },
--       },
--       hint = {
--         enable = true,
--         -- setType = false,
--         -- paramType = true,
--         -- paramName = "Disable",
--         -- semicolon = "Disable",
--         -- arrayIndex = "Disable",
--       },
--     },
--   },
-- }

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- pyright = {
        --   settings = {
        --     python = {
        --       analysis = {
        --         autoSearchPaths = true,
        --         diagnosticMode = "workspace",
        --         -- NOTE: 以下两行可以避免type-stubs所引起的问题
        --         typeCheckingMode = "off",
        --         useLibraryCodeForTypes = true,
        --       },
        --     },
        --   },
        -- },
        -- 使用basedpyright，可以提供inlay hints
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                -- NOTE: 以下两行可以避免type-stubs所引起的问题
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
