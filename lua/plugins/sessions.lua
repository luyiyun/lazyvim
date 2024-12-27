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
}
