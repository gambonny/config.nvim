return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>'", ":Neotree toggle filesystem reveal left<cr>" },
    { "<leader>[", ":Neotree toggle filesystem reveal left<cr>" },
    { "<leader>]", ":Neotree toggle filesystem reveal left<cr>" },
    { "<leader>ob", ":Neotree float buffers reveal<cr>" },
    { "<leader>oh", ":Neotree toggle git_status reveal left<cr>" },
    { "<leader>on", ":Neotree toggle git_status git_base=main<cr>" },
    { "<leader>or", ":Neotree toggle git_status git_base=master<cr>" },
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    })

    require("neo-tree.command").execute({
      action = "show",
      reveal_force_cwd = true,
    })
  end,
}
