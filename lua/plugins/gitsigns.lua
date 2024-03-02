local uncommitted_files = {}
local current_file_index = 1

local function update_uncommitted_files()
  local handle = io.popen("git ls-files --modified --others --exclude-standard")
  local result = handle:read("*a")
  handle:close()

  uncommitted_files = {}
  for file in result:gmatch("[^\r\n]+") do
    table.insert(uncommitted_files, file)
  end
  current_file_index = 1
end

local function next_uncommitted_file()
  if #uncommitted_files == 0 then
    update_uncommitted_files()
  end
  if #uncommitted_files > 0 then
    current_file_index = current_file_index % #uncommitted_files + 1
    vim.cmd("edit " .. uncommitted_files[current_file_index])
  else
    print("No uncommitted files found.")
  end
end

local function prev_uncommitted_file()
  if #uncommitted_files == 0 then
    update_uncommitted_files()
  end
  if #uncommitted_files > 0 then
    current_file_index = (current_file_index - 2) % #uncommitted_files + 1
    vim.cmd("edit " .. uncommitted_files[current_file_index])
  else
    print("No uncommitted files found.")
  end
end

vim.keymap.set("n", "]H", next_uncommitted_file, { noremap = true, silent = true })
vim.keymap.set("n", "[H", prev_uncommitted_file, { noremap = true, silent = true })

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      require("scrollbar.handlers.gitsigns").setup({
        trouble = true,
      }),
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            return "]h"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, {
          expr = true,
          desc = "Next hunk",
        })

        map("n", "[h", function()
          if vim.wo.diff then
            return "[h"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, {
          expr = true,
          desc = "Previous hunk",
        })

        -- Actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns stage hunk" })
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns stage buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Gitsigns undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
        map("n", "<leader>hi", gs.preview_hunk_inline, { desc = "Gitsigns preview hunk inline" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, { desc = "Gitsigns blame line" })
        map("n", "<leader>hl", gs.toggle_current_line_blame, { desc = "Gitsigns current line blame" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Gitsigns diff this" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "Gitsigns diff this -" })
        map("n", "<leader>ht", gs.toggle_deleted, { desc = "Gitsigns toggle deleted" })
        map("n", "<leader>hq", ":Gitsigns setqflist<CR>", { desc = "Gitsigns qflist" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select hunk" })
      end,
    })
  end,
}
