return {
  "folke/trouble.nvim",
  lazy = true,
  ft = "qf",
  event = "DiagnosticChanged",
  config = function()
    require("trouble").setup()
    local function use_trouble()
      local trouble = require("trouble")
      if vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0 then
        vim.defer_fn(function()
          vim.cmd.lclose()
          trouble.open("loclist")
        end, 0)
      else
        vim.defer_fn(function()
          vim.cmd.cclose()
          trouble.open("quickfix")
        end, 0)
      end
    end
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "qf" },
      callback = use_trouble,
    })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
