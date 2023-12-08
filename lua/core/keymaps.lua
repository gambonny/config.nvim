vim.g.mapleader = ";"

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General keymaps
keymap("n", "<leader>ww", "<cmd>update<cr>", opts)
keymap("n", "<leader>xx", "<cmd>x<cr>", opts)
keymap("n", "<leader>qq", "<cmd>q!<cr>", opts)
keymap("n", "<leader>qQ", "<cmd>qall!<cr>", opts)
keymap("n", "<leader>vi", ":e ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "j", "<plug>(accelerated_jk_gj)", opts)

-- Gitsigns
keymap("n", "<leader>chr", ":Gitsigns change_base master global async<cr>", opts)
keymap("n", "<leader>chn", ":Gitsigns change_base main global async<cr>", opts)
keymap("n", "<leader>chs", ":Gitsigns change_base nil true async<cr>", opts)

-- Smart splits
keymap("n", "<leader>ly", "<cmd>lua require('smart-splits').resize_left()<cr>", opts)
keymap("n", "<leader>lu", "<cmd>lua require('smart-splits').resize_down()<cr>", opts)
keymap("n", "<leader>li", "<cmd>lua require('smart-splits').resize_up()<cr>", opts)
keymap("n", "<leader>lo", "<cmd>lua require('smart-splits').resize_right()<cr>", opts)

keymap("n", "<leader>lh", "<cmd>lua require('smart-splits').move_cursor_left()<cr>", opts)
keymap("n", "<leader>lj", "<cmd>lua require('smart-splits').move_cursor_down()<cr>", opts)
keymap("n", "<leader>lk", "<cmd>lua require('smart-splits').move_cursor_up()<cr>", opts)
keymap("n", "<leader>ll", "<cmd>lua require('smart-splits').move_cursor_right()<cr>", opts)

-- Harpoon
keymap("n", "<leader>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<leader>ar", "<cmd>lua require('harpoon.mark').rm_file()<cr>", opts)
keymap("n", "<leader>ac", "<cmd>lua require('harpoon.mark').clear_all()<cr>", opts)
keymap("n", "<leader>a1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>a2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<leader>a3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>a4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<leader>a5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "<leader>a6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts)
keymap("n", "<leader>a7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts)
keymap("n", "<leader>a8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts)
keymap("n", "<leader>a9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts)

keymap("n", "[a", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "]a", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>tg", ":Telescope grep_string<cr>", opts)
keymap("n", "<leader>ts", ":Telescope git_status<cr>", opts)
keymap("n", "<leader>tr", ":Telescope resume<cr>", opts)

-- Telescope plugins
keymap("n", "<leader>ta", ":Telescope harpoon marks<cr>", opts)
keymap("n", "<leader>tl", ":Telescope egrepify<cr>", opts)
keymap("n", "<leader>ti", ":Telescope import<cr>", opts)
keymap("n", "<leader>t.", ":Telescope adjacent <cr>", opts)
keymap("n", "<leader>tw", ":Telescope whaler<cr>", opts)

-- Neogit
keymap("n", "<leader>hh", "<cmd>lua require('neogit').open()<cr>", opts)

-- Maximize
keymap("n", "<leader>mm", "<cmd>lua require('maximize').toggle()<cr>", opts)

-- Portal
keymap("n", "<leader>oo", "<cmd>Portal jumplist backward<cr>", opts)
keymap("n", "<leader>oi", "<cmd>Portal jumplist forward<cr>", opts)

-- Outline
keymap("n", "<leader>os", "<cmd>SymbolsOutline<cr>", opts)

-- Diagnostics
keymap("n", "<leader>ds", "<cmd>DiagWindowShow<cr>", opts)
