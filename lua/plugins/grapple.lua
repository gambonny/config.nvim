local utils = require("utils")
local opts_with_desc = utils.opts_with_desc
local keymap = vim.api.nvim_set_keymap

return {
  "cbochs/grapple.nvim",
  config = function()
    vim.keymap.set("n", "<leader>ga", require("grapple").toggle)
    vim.keymap.set("n", "<leader>gt", require("grapple").toggle_tags)
    vim.keymap.set("n", "<leader>gs", require("grapple").toggle_scopes)
    vim.keymap.set("n", "<leader>gl", require("grapple").toggle_loaded)

    keymap("n", "]g", "<cmd>Grapple cycle forward scope=cwd<cr>", opts_with_desc("Grapple cycle forward"))
    keymap("n", "[g", "<cmd>Grapple cycle backward scope=cwd<cr>", opts_with_desc("Grapple cycle backward"))
  end,
}
