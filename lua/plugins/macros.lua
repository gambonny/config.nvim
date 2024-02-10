return {
  "kr40/nvim-macros",
  cmd = { "MacroSave", "MacroYank", "MacroSelect", "MacroDelete" },
  opts = {

    json_file_path = vim.fs.normalize(vim.fn.stdpath("config") .. "/macros.json"),
    default_macro_register = "q",
    json_formatter = "jq",
  },
}
