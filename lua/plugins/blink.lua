return {
  {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.compat", "R-nvim/cmp-r" },
    opts = function(_, opts)
      opts.keymap = {
        preset = "default",
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      }
      opts.sources = {
        -- remember to enable your providers here
        default = { "lsp", "path", "snippets", "buffer", "r" },
        providers = {
          -- create provider
          r = {
            name = "cmp_r", -- IMPORTANT: use the same name as you would for nvim-cmp
            module = "blink.compat.source",

            -- all blink.cmp source config options work as normal:
            score_offset = -3,

            -- this table is passed directly to the proxied completion source
            -- as the `option` field in nvim-cmp's source config
            --
            -- this is NOT the same as the opts in a plugin's lazy.nvim spec
            -- opts = {
            --   -- this is an option from cmp-digraphs
            --   cache_digraphs_on_start = true,
            -- },
          },
        },
        cmdline = {},
      }
    end,
  },
}
