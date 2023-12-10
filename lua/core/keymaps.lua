local utils = require("utils")
local ls = require("luasnip").ls

local opts = utils.opts
local opts_with_desc = utils.opts_with_desc
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ";"

-- General keymaps
keymap("n", "<leader>ww", "<cmd>update<cr>", opts_with_desc("Update"))
keymap("n", "<leader>xx", "<cmd>x<cr>", opts_with_desc("x"))
keymap("n", "<leader>qq", "<cmd>q!<cr>", opts_with_desc("Close buffer w/o save"))
keymap("n", "<leader>qt", "<cmd>tabclose!<cr>", opts_with_desc("Close tab w/o save"))
keymap("n", "<leader>qQ", "<cmd>qall!<cr>", opts_with_desc("Close editor w/o save"))
keymap("n", "<leader>vi", ":e ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "j", "<plug>(accelerated_jk_gj)", opts)
keymap("n", "[t", "<cmd>tabprevious<cr>", opts)
keymap("n", "]t", "<cmd>tabnext<cr>", opts)

-- Gitsigns
keymap("n", "<leader>chr", ":Gitsigns change_base master global async<cr>", opts_with_desc("Change base to master"))
keymap("n", "<leader>chn", ":Gitsigns change_base main global async<cr>", opts_with_desc("Change base to main"))
keymap("n", "<leader>chs", ":Gitsigns change_base nil true async<cr>", opts_with_desc("Reset base"))

-- Smart splits
keymap("n", "<leader>ly", "<cmd>lua require('smart-splits').resize_left()<cr>", opts_with_desc("Resize left"))
keymap("n", "<leader>lu", "<cmd>lua require('smart-splits').resize_down()<cr>", opts_with_desc("Resize down"))
keymap("n", "<leader>li", "<cmd>lua require('smart-splits').resize_up()<cr>", opts_with_desc("Resize up"))
keymap("n", "<leader>lo", "<cmd>lua require('smart-splits').resize_right()<cr>", opts_with_desc("Resize right"))

keymap("n", "<leader>lh", "<cmd>lua require('smart-splits').move_cursor_left()<cr>", opts_with_desc("Move left"))
keymap("n", "<leader>lj", "<cmd>lua require('smart-splits').move_cursor_down()<cr>", opts_with_desc("Move down"))
keymap("n", "<leader>lk", "<cmd>lua require('smart-splits').move_cursor_up()<cr>", opts_with_desc("Move up"))
keymap("n", "<leader>ll", "<cmd>lua require('smart-splits').move_cursor_right()<cr>", opts_with_desc("Move right"))

-- Harpoon
keymap("n", "<leader>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts_with_desc("Harpoon add"))
keymap("n", "<leader>ar", "<cmd>lua require('harpoon.mark').rm_file()<cr>", opts_with_desc("Harpoon remove"))
keymap("n", "<leader>ac", "<cmd>lua require('harpoon.mark').clear_all()<cr>", opts_with_desc("Harpoon clear"))

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
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts_with_desc("Ts find files"))
keymap("n", "<leader>tg", ":Telescope grep_string<cr>", opts_with_desc("Ts grep string"))
keymap("n", "<leader>ts", ":Telescope git_status<cr>", opts_with_desc("Ts git status"))
keymap("n", "<leader>tr", ":Telescope resume<cr>", opts_with_desc("Ts resume"))

-- Telescope plugins
keymap("n", "<leader>ta", ":Telescope harpoon marks<cr>", opts_with_desc("Ts harpoon"))
keymap("n", "<leader>tl", ":Telescope egrepify<cr>", opts_with_desc("Ts egrepify"))
keymap("n", "<leader>ti", ":Telescope import<cr>", opts_with_desc("Ts import"))
keymap("n", "<leader>t.", ":Telescope adjacent <cr>", opts_with_desc("Ts adjacent"))
keymap("n", "<leader>tw", ":Telescope whaler<cr>", opts_with_desc("Ts whaler"))

-- Neogit
keymap("n", "<leader>hh", "<cmd>lua require('neogit').open()<cr>", opts_with_desc("Neogit"))

-- Portal
keymap("n", "<leader>oo", "<cmd>Portal jumplist backward<cr>", opts_with_desc("Portal jump backward"))
keymap("n", "<leader>oi", "<cmd>Portal jumplist forward<cr>", opts_with_desc("Portal jump forward"))

-- Outline
keymap("n", "<leader>os", "<cmd>Outline!<cr>", opts_with_desc("Toggle Outline"))

-- Diagnostics
keymap("n", "<leader>ds", "<cmd>DiagWindowShow<cr>", opts_with_desc("Diagnostic Show"))

--- Go to preview
keymap(
  "n",
  "<leader>gpd",
  "<cmd>lua require('goto-preview').goto_preview_definition()<cr>",
  opts_with_desc("Preview definition")
)
keymap(
  "n",
  "<leader>gpt",
  "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>",
  opts_with_desc("Preview type definition")
)
keymap(
  "n",
  "<leader>gpi",
  "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>",
  opts_with_desc("Preview implementation")
)
keymap(
  "n",
  "<leader>gpr",
  "<cmd>lua require('goto-preview').goto_preview_references()<cr>",
  opts_with_desc("Preview references")
)
keymap("n", "<leader>gP", "<cmd>lua require('goto-preview').close_all_win()<cr>", opts_with_desc("Close preview"))

-- Trouble
keymap("n", "<leader>tt", "<cmd>TroubleToggle<CR>", opts_with_desc("Toggle Trouble"))
keymap("n", "]q", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", opts)
keymap("n", "[q", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", opts)
keymap("n", "[Q", "<cmd>lua require('trouble').first({skip_groups = true, jump = true})<cr>", opts)
keymap("n", "]Q", "<cmd>lua require('trouble').last({skip_groups = true, jump = true})<cr>", opts)

-- Windows
keymap("n", "<leader>wo", "<cmd>WindowsMaximize<cr>", opts_with_desc("Toggle max window"))
keymap("n", "<leader>w=", "<cmd>WindowsEqualize<cr>", opts_with_desc("Equalize windows"))
keymap("n", "<leader>w|", "<cmd>WindowsMaximizeVertically<cr>", opts_with_desc("Max windows vertically"))
keymap("n", "<leader>w_", "<cmd>WindowsMaximizeHorizontally<cr>", opts_with_desc("Max windows horizontally"))

keymap("n", "<leader>w<", "30<C-w><", opts_with_desc("30 <"))
keymap("n", "<leader>w>", "30<C-w>>", opts_with_desc("30 >"))
keymap("n", "<leader>w-", "10<C-w>-", opts_with_desc("10 -"))
keymap("n", "<leader>w+", "10<C-w>+", opts_with_desc("10 +"))

-- Luasnip
keymap("i", "<A-d>", "<cmd>lua require('luasnip').jump(1)<cr>", {})
keymap("n", "<A-d>", "<cmd>lua require('luasnip').jump(1)<cr>", {})
keymap("i", "<A-p>", "<cmd>lua require('luasnip').jump(-1)<cr>", {})
keymap("n", "<A-p>", "<cmd>lua require('luasnip').jump(-1)<cr>", {})
