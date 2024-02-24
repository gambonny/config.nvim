return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = {
    { "<leader><leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
  opts = {
    float_diff = false,
  },
}
