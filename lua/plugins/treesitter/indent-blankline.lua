local highlight = {
  "CursorColumn",
  "Whitespace",
}

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {
    enabled = true,
    indent = { highlight = highlight, char = "" },
    whitespace = {
      highlight = highlight,
      remove_blankline_trail = false,
    },
    scope = { enabled = false },
  },
}
