return {
  "glepnir/oceanic-material",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd([[
      set background=dark
      colorscheme oceanic_material
    ]])
  end,
}
