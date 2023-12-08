return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd([[
      set background=dark
      colorscheme tokyonight-night
    ]])
  end,
}
