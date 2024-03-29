local git_icons = {
  added = "",
  changed = "",
  copied = ">",
  deleted = "",
  unmerged = "‡",
  untracked = "?",
}

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  tag = "0.1.3",
  config = function()
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    require("telescope").setup({
      defaults = {
        path_display = { "truncate" },
        layout_strategy = "flex",
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " 🔍 ",
        color_devicons = true,
        git_icons = git_icons,
        sorting_strategy = "ascending",
        file_ignore_patterns = { "^.git/" },
        layout_config = {
          horizontal = {
            preview_cutoff = 100,
            preview_width = 0.5,
          },
          vertical = {
            preview_cutoff = 0.4,
          },
          flex = {
            flip_columns = 110,
          },
          height = 0.94,
          width = 0.86,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-a>"] = actions.cycle_previewers_prev,
            ["<c-t>"] = trouble.open_with_trouble,
            ["<ESC>"] = actions.close,
          },
          n = {
            ["<C-s>"] = actions.cycle_previewers_next,
            ["<C-a>"] = actions.cycle_previewers_prev,
            ["<c-t>"] = trouble.open_with_trouble,
          },
        },
      },
      extensions = {
        fzf = {
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        whaler = {
          oneoff_directories = {
            { path = "~/dev/dh/plugins/current/dashboard/js/dashboard/", alias = "vri-dashboard" },
            { path = "~/dev/dh/plugins/current/rats_revs/js/reviews/", alias = "vri-rat_revs" },
            { path = "~/dev/dh/plugins/current/trends/js/trends/frontend/", alias = "vri-trends" },
            { path = "~/dev/dh/plugins/current/orders/js/orders/", alias = "vri-orders" },
            { path = "~/dev/dh/plugins/current/finance/js/finance/", alias = "vri-finance" },
          },
          file_explorer = "neotree",
          auto_file_explorer = true,
          auto_cwd = true,
        },
        import = {
          insert_at_top = true,
        },
      },
    })

    local previewers = require("telescope.previewers")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local sorters = require("telescope.sorters")
    local changed_on_branch = function()
      pickers
        .new({
          results_title = "Modified on current branch",
          finder = finders.new_oneshot_job({
            "git",
            "diff",
            "--name-only",
            "--relative",
            "master",
          }),
          sorter = sorters.get_fuzzy_file(),
          previewer = previewers.new_termopen_previewer({
            get_command = function(entry)
              return { "git", "diff", "--relative", "master", entry.value }
            end,
          }),
        })
        :find()
    end

    vim.api.nvim_create_user_command("MB", changed_on_branch, {})
  end,
}
