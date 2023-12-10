return {
  "kwkarlwang/bufresize.nvim",
  config = function()
    require("bufresize").setup({
      resize = {
        keys = {},
        trigger_events = { "VimResized" },
        increment = 5,
      },
    })
  end,
}
