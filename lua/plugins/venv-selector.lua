local osname = vim.uv.os_uname().sysname

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
      local search = {}
      if osname == "Windows_NT" then
        search["micromamba_envs"] = {
          -- command = "$FD python.exe$ $env:MAMBA_ROOT_PREFIX/envs --full-path -a -E Lib",
          command = "$FD python.exe$ $HOME/.local/share/mamba/envs --full-path -a -E Lib",
        }
      elseif osname == "Linux" then
        search["miniconda_base"] = {
          command = "find $HOME/miniforge3/bin -type f -wholename '*bin/python*'|grep -v config",
          type = "anaconda", -- 必须是anaconda，不然会报错
        }
        search["miniconda_envs"] = {
          command = "find $HOME/miniforge3/envs -type f -wholename '*bin/python*'|grep -v Lib",
          type = "anaconda",
        }
      end
      require("venv-selector").setup({
        settings = {
          search = search,
          options = {
            notify_user_on_venv_activation = true,
            debug = true,
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
          local venv_name = nil
          if osname == "Windows_NT" then
            local py_path = require("venv-selector").python()
            venv_name = string.match(py_path, "envs\\(.+)\\python.exe")
          else
            local full_path = require("venv-selector").venv()
            venv_name = string.match(full_path, "envs/(.+)")
          end
          if venv_name ~= nil then
            return " " .. venv_name
            -- return venv_name
          else
            return "venv"
          end
        end,
      })
    end,
  },
}
