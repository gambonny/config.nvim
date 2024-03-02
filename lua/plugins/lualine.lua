return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- fancy icons
    "linrongbin16/lsp-progress.nvim", -- LSP loading progress
  },
  opts = {
    sections = {
      lualine_b = {
        {
          require("grapple").statusline,
          cond = require("grapple").exists,
        },
      },
      lualine_c = {
        {
          "filename",
          file_status = true,
          newfile_status = false,
          path = 4,
          symbols = {
            modified = "[+]",
            readonly = "[-]",
          },
        },
      },
    },
  },
}
