local M = {}

M.opts = { noremap = true, silent = true }

function M.opts_with_desc(description, extras)
  local extended_opts = { desc = description, table.unpack(M.opts) }

  if extras then
    for k, v in pairs(extras) do
      extended_opts[k] = v
    end
  end

  return extended_opts
end

return M
