return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
  },
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    endwise = { enable = true },
    auto_install = true,
    ensure_installed = {
      "lua",
      "typescript",
      "tsx",
      "html",
      "css",
      "javascript",
      "markdown",
      "yaml",
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>ss"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>SS"] = "@parameter.inner",
        },
      },
    },
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end,
}
