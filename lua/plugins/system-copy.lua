return {
  "christoomey/vim-system-copy",
  config = function()
    vim.cmd[[
      let g:system_copy_silent = 1
    ]]
  end
}
