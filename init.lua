-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
  })
end
vim.opt.rtp:prepend(lazypath)

-- Improve startup time
vim.loader.enable()

-- This has to be set before initializing lazy
vim.g.mapleader = ";"

-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.treesitter" },
  { import = "plugins.lsp" },
  {
    import = "plugins.telescope",
  },
  { import = "plugins.mini" },
}, {
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- turn off notifications whenever plugin changes are made
  },
})

vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]])

-- These modules are not loaded by lazy
require("core.options")
require("core.keymaps")
