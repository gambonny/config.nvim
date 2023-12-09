local M = {}

M.opts = { noremap = true, silent = true }

function M.opts_with_desc(description)
  return { desc = description, table.unpack(M.opts) }
end

return M
