-- since this is just an example spec, don't actually load anything here and return an empty spec
-- 删除stylua ignore来让lsp生效
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          settings = {
            python = {
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
