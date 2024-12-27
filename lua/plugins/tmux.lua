return {
  -- {
  --   "aserowy/tmux.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- navigation = { enable_default_keybinds = true },  -- navigation 默认是C-hjkl，正好用就可以
  --     resize = { enable_default_keybinds = false }, -- resize 默认是A-hjkl，需要去掉
  --   },
  --   keys = {
  --     { "<C-Left>", "<cmd>lua require('tmux').resize_left()<cr>", desc = "resize panel (left)" },
  --     { "<C-Down>", "<cmd>lua require('tmux').resize_bottom()<cr>", desc = "resize panel (down)" },
  --     { "<C-Up>", "<cmd>lua require('tmux').resize_top()<cr>", desc = "resize panel (up)" },
  --     { "<C-Right>", "<cmd>lua require('tmux').resize_right()<cr>", desc = "resize panel (right)" },
  --   },
  -- },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
