local opts_with_desc = require("utils").opts_with_desc

return {
  "kwkarlwang/bufresize.nvim",
  config = function()
    require("bufresize").setup({
      register = {
        keys = {
          { "n", "<leader>w<", "30<C-w><", opts_with_desc("30 <") },
          { "n", "<leader>w>", "30<C-w>>", opts_with_desc("30 >") },
          { "n", "<leader>w-", "10<C-w>-", opts_with_desc("10 <") },
          { "n", "<leader>w+", "10<C-w>+", opts_with_desc("10 >") },
        },
        trigger_events = { "BufWinEnter", "WinEnter" },
      },
      resize = {
        keys = {},
        trigger_events = { "VimResized" },
        increment = 5,
      },
    })
  end,
}
