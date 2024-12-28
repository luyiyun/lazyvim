return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup({
        settings = {
          search = {
            miniforge_base = {
              command = "find $HOME/miniforge3/bin -type f -wholename '*bin/python*'|grep -v config",
              type = "miniforge3",
            },
            miniforge_envs = {
              command = "find $HOME/miniforge3/envs -type f -wholename '*bin/python*'|grep -v config",
              type = "miniforge3",
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "select python enviroment" },
      {
        "<leader>vd",
        function()
          require("venv-selector").deactivate()
        end,
        desc = "python enviroment deactivate",
      },
      {
        "<leader>vl",
        function()
          local full_path = require("venv-selector").venv()
          require("noice").notify(full_path, "info")
        end,
        desc = "show the active enviroment name",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          local full_path = require("venv-selector").venv()
          local venv_name = string.match(full_path, "envs/(.+)")
          if venv_name ~= nil then
            -- return "" + venv_name
            return venv_name
          else
            return "venv"
          end
        end,
      })
    end,
  },
}
