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
          directories = {
            { path = "~/dev/personal/gambonny/", alias = "Gambonny" },
            { path = "~/dev/dh/plugins/vendor-growth-web-mfes/packages/", alias = "OneWeb Plugins" },
          },
          oneoff_directories = {
            { path = "~/dev/dh/plugins/ump/current/", alias = "UMP plugin" },
          },
          file_explorer = "neotree",
        },
        import = {
          insert_at_top = true,
        },
      },
    })
  end,
}
