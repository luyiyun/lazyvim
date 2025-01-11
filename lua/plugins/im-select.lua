return {
  {
    "keaising/im-select.nvim",
    enabled = vim.uv.os_uname().sysname == "Windows_NT",
    config = function()
      require("im_select").setup({
        default_im_select = "1033",
        default_command = "im-select.exe",
        -- 删除了 "FocusGained"和"CmdlineLeave"两项events，这两项
        -- 会让我们在离开vim窗口和保存（因为会运行cmdline）时运行
        -- 一次im-select，但这时候一般都是normal模式，所以会将
        -- 1033（英文）保存为previous mode。
        -- 即使我们上次在insert模式下是中文，但是previous mode以及
        -- 被覆盖，所以当我们再次切回insert模式时，就一直时英文了。
        -- 因为我一般都是用:w来保存，并且会多次切出vim来运行和查看
        -- 文档，所以这个问题对我影响还是很大的。
        -- 所以，这里我们将这两个events去掉，只保留"VimEnter"和"InsertLeave"
        set_default_events = { "VimEnter", "InsertLeave" },
      })
    end,
  },
}
