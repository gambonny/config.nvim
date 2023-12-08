return {
  "mrjones2014/smart-splits.nvim",
  config = true,
  opts = {
    resize_mode = {
      hooks = {
        on_leave = require("bufresize").register,
      },
    },
  },
}
