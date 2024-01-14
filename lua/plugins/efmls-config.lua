return {
  "creativenull/efmls-configs-nvim",
  version = "v1.x.x",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local eslint = require("efmls-configs.linters.eslint")
    local languages = {
      typescript = { eslint },
    }

    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { ".git/", "../../.git" },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
    }

    require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))
  end,
}
