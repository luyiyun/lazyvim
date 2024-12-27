-- since this is just an example spec, don't actually load anything here and return an empty spec
-- 删除stylua ignore来让lsp生效
return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    config = function() -- 配置放在opts中没有生效，只有放在config中才会生效
      require("venv-selector").setup({
        -- Your options go here
        -- name = "venv",
        -- auto_refresh = false
        search = false,
        search_workspace = false,
        auto_refresh = true,
        anaconda_base_path = "$HOME/miniforge3", -- 最后不要加/
        anaconda_envs_path = "$HOME/miniforge3/envs",
      })
    end,
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
      {
        "<leader>vd",
        function()
          require("venv-selector").deactivate_venv()
        end,
        desc = "python enviroment deactivate",
      },
      {
        "<leader>vl",
        function()
          require("noice").notify(require("venv-selector").get_active_venv())
        end,
        desc = "show active python enviroment",
      },
    },
  },
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
