return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufRead",
  depencencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    -- NOTE: the configure function of rainbow-delimiters is not
    -- same as other plugins, it doesn't have a setup function
    require("rainbow-delimiters.setup").setup({})
  end,
}
