return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- fancy icons
    "linrongbin16/lsp-progress.nvim", -- LSP loading progress
  },
  opts = {
    sections = {
      lualine_c = {
        {
          "filename",
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 4,
          symbols = {
            modified = "[+]", -- Text to show when the file is modified.
            readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
          },
        },
      },
    },
  },
}
