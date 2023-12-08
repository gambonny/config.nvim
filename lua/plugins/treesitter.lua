return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  opts = {
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
    highlight = { enable = true },
    indent = { enable = true },
    endwise = { enable = true },
    autotag = { enable = true },
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
          ["<leader>wn"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>wp"] = "@parameter.inner",
        },
      },
    },
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end,
}
