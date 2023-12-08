vim.g.mapleader = ";"

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General keymaps
keymap("n", "<leader>ww", "<cmd>update<cr>", opts)
keymap("n", "<leader>xx", "<cmd>x<cr>", opts)
keymap("n", "<leader>qq", "<cmd>q!<cr>", opts)
keymap("n", "<leader>vi", ":e ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "j", "<plug>(accelerated_jk_gj)", opts)

-- Gitsigns
keymap("n", "<leader>chr", ":Gitsigns change_base master global async<cr>", opts)
keymap("n", "<leader>chn", ":Gitsigns change_base main global async<cr>", opts)
keymap("n", "<leader>chs", ":Gitsigns change_base nil true async<cr>", opts)
