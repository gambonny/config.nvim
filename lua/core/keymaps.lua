local utils = require("utils")

local opts = utils.opts
local opts_with_desc = utils.opts_with_desc
local keymap = vim.api.nvim_set_keymap

-- General keymaps
keymap("n", "<leader>ww", "<cmd>update<cr>", opts_with_desc("Update"))
keymap("n", "<leader>xx", "<cmd>:%Bwipeout<cr>", opts_with_desc("x"))
keymap("n", "<leader>qq", "<cmd>q!<cr>", opts_with_desc("Close buffer w/o save"))
keymap("n", "<leader><Space>", "<cmd>Bdelete!<cr>", opts_with_desc("Close buffer w/o save"))
keymap("n", "<leader>_", "<cmd>Bwipeout!<cr>", opts_with_desc("wipeout buffer"))
keymap("n", "<leader><leader>_", "<cmd>bdelete!<cr>", opts_with_desc("delete buffer"))
keymap("n", "<leader>qt", "<cmd>tabclose!<cr>", opts_with_desc("Close tab w/o save"))
keymap("n", "<leader>qQ", "<cmd>qall!<cr>", opts_with_desc("Close editor w/o save"))
keymap("n", "<leader>vi", ":e ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "j", "<plug>(accelerated_jk_gj)", opts)
keymap("n", "[t", "<cmd>tabprevious<cr>", opts)
keymap("n", "]t", "<cmd>tabnext<cr>", opts)

-- Gitsigns
keymap("n", "<leader>chr", ":Gitsigns change_base master global async<cr>", opts_with_desc("Change base to master"))
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

keymap("n", "<leader>11", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>22", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<leader>33", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>44", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<leader>55", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "<leader>66", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts)
keymap("n", "<leader>77", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts)
keymap("n", "<leader>88", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts)
keymap("n", "<leader>99", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts)

keymap("n", "[a", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "]a", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts_with_desc("Ts find files"))
keymap("n", "<leader>tg", ":Telescope grep_string<cr>", opts_with_desc("Ts grep string"))
keymap("n", "<leader><leader>,", ":Telescope git_status<cr>", opts_with_desc("Ts git status"))
keymap("n", "<leader>tr", ":Telescope resume<cr>", opts_with_desc("Ts resume"))
keymap("n", "<leader>tb", ":MB<cr>", opts_with_desc("Modified in current branch"))

-- Telescope plugins
keymap("n", "<leader>tl", ":Telescope egrepify<cr>", opts_with_desc("Ts egrepify"))
keymap("n", "<leader>ti", ":Telescope import<cr>", opts_with_desc("Ts import"))
keymap("n", "<leader><leader>/", ":Telescope harpoon marks<cr>", opts_with_desc("Ts harpoon"))
keymap("n", "<leader><leader>.", ":Telescope adjacent <cr>", opts_with_desc("Ts adjacent"))
keymap("n", "<leader>tw-", ":Telescope whaler<cr>", opts_with_desc("Ts whaler"))

vim.keymap.set("n", "<leader>tw_", function()
  local w = require("telescope").extensions.whaler.whaler
  w({
    auto_file_explorer = true,
    auto_cwd = false,
    file_explorer_config = {
      plugin_name = "telescope",
      command = "Telescope find_files",
      prefix_dir = " cwd=",
    },
    theme = {
      previewer = false,
    },
  })
end)

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
keymap("i", "<A-d>", "<cmd>lua require('luasnip').jump(1)<cr>", opts)
keymap("n", "<A-d>", "<cmd>lua require('luasnip').jump(1)<cr>", opts)
keymap("i", "<A-p>", "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
keymap("n", "<A-p>", "<cmd>lua require('luasnip').jump(-1)<cr>", opts)

-- Open in GitHub
keymap("n", "<leader>ogr", "<cmd>OpenInGHRepo<cr>", opts_with_desc("Open repo GH"))
keymap("n", "<leader>ogf", "<cmd>OpenInGHFile<cr>", opts_with_desc("Open file GH"))
keymap("n", "<leader>ogp", "<cmd>OpenInGHPullRequest<cr>", opts_with_desc("Open PR in GH"))

-- Bookmarks
keymap("n", "<leader>mm", "<cmd>BookmarksMark<cr>", opts_with_desc("Mark current line into active BookmarkList"))
keymap("n", "<leader>mo", "<cmd>BookmarksGoto<cr>", opts_with_desc("Go to bookmark at current active BookmarkList"))
keymap("n", "<leader>ma", "<cmd>BookmarksCommands<cr>", opts_with_desc("Find and trigger a bookmark command"))

-- Grapple
vim.keymap.set("n", "<leader>ga", require("grapple").toggle)
vim.keymap.set("n", "<leader>gt", require("grapple").toggle_tags)
vim.keymap.set("n", "<leader>gs", require("grapple").toggle_scopes)
vim.keymap.set("n", "<leader>gl", require("grapple").toggle_loaded)

keymap("n", "]g", "<cmd>Grapple cycle forward scope=cwd<cr>", opts_with_desc("Grapple cycle forward"))
keymap("n", "[g", "<cmd>Grapple cycle backward scope=cwd<cr>", opts_with_desc("Grapple cycle backward"))

-- Todo-Comments
keymap("n", "<leader>t_q", "<cmd>TodoQuickFix<cr>", opts_with_desc("Todo QuickFix"))
keymap("n", "<leader>t_t", "<cmd>TodoTelescope<cr>", opts_with_desc("Todo Telescope"))
