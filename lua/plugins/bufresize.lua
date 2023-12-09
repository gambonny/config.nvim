local opts = require("utils").opts

return {
  "kwkarlwang/bufresize.nvim",
  config = function()
    require("bufresize").setup({
      register = {
        keys = {
          { "n", "<leader>w<", "30<C-w><", opts },
          { "n", "<leader>w>", "30<C-w>>", opts },
          { "n", "<leader>w-", "10<C-w>-", opts },
          { "n", "<leader>w+", "10<C-w>+", opts },
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
