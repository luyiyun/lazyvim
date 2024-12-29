return {
  {
    "Shatur/neovim-session-manager",
    -- event = "VeryLazy",
    keys = {
      { "<leader>fs", "<cmd>SessionManager load_session<cr>", desc = "Telescope sessions" },
    },
    dependencies = "telescope.nvim", -- 为了能够使用到telescope
    config = function()
      local session_manager = require("session_manager")
      session_manager.setup({})

      local config_group = vim.api.nvim_create_augroup("SessionGroup", {})

      -- save session every time a buffer is written
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = config_group,
        callback = function()
          if vim.bo.filetype ~= "git" and not vim.bo.filetype ~= "gitcommit" and not vim.bo.filetype ~= "gitrebase" then
            session_manager.autosave_session()
          end
        end,
      })
    end,
  },

  -- {
  --   "rmagatti/auto-session",
  --   lazy = false,
  --   keys = {
  --     -- Will use Telescope if installed or a vim.ui.select picker otherwise
  --     { "<leader>fs", "<cmd>SessionSearch<CR>", desc = "Session search" },
  --     -- { "<leader>qs", "<cmd>SessionSave<CR>", desc = "Save session" },
  --     -- { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
  --   },
  --
  --   opts = {
  --     -- Whether to show a notification when auto-restoring
  --     show_auto_restore_notif = true,
  --     -- ⚠️ This will only work if Telescope.nvim is installed
  --     -- The following are already the default values, no need to provide them if these are already the settings you want.
  --     session_lens = {
  --       -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
  --       load_on_setup = true,
  --       previewer = false,
  --       mappings = {
  --         -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
  --         delete_session = { "i", "<C-D>" },
  --         alternate_session = { "i", "<C-S>" },
  --         copy_session = { "i", "<C-Y>" },
  --       },
  --       -- Can also set some Telescope picker options
  --       -- For all options, see: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
  --       theme_conf = {
  --         border = true,
  --         -- layout_config = {
  --         --   width = 0.8, -- Can set width and height as percent of window
  --         --   height = 0.5,
  --         -- },
  --       },
  --     },
  --     bypass_save_filetypes = { "dashboard" },
  --   },
  -- },
}
