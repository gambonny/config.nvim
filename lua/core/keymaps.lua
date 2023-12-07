vim.g.mapleader = ";"

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General keymaps
keymap("n", "<leader>ww", "<cmd>update<cr>", opts)
keymap("n", "<leader>xx", "<cmd>x<cr>", opts)
keymap("n", "<leader>qq", "<cmd>q!<cr>", opts)
keymap("n", "<leader>vi", ":e ~/.config/nvim/init.lua<cr>", opts)
