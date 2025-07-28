local M = {}

--- Parse the quickfix list into structured entries.
---@return table[] entries
function M.parse()
  local raw = vim.fn.getqflist()
  local entries = {}

  for _, item in ipairs(raw) do
    local filename = item.bufnr > 0 and vim.api.nvim_buf_get_name(item.bufnr) or item.filename
    table.insert(entries, {
      filename = filename,
      lnum = item.lnum,
      col = item.col,
      text = item.text,
    })
  end

  return entries
end

--- Apply a function to each parsed entry.
---@param fn fun(entry: table): any
---@return table
function M.map(fn)
  local out = {}
  for _, entry in ipairs(M.parse()) do
    table.insert(out, fn(entry))
  end
  return out
end

return M
