---@class Customutil
local M = {}

M.log_to_file = function(...)
  local args = { ... }
  local str = ""
  for _, v in ipairs(args) do
    str = str .. vim.inspect(v) .. " "
  end
  str = str .. "\n"

  local fp = io.open("/tmp/nvim.log", "a")
  if fp then
    fp:write(str)
    fp:close()
  end
end

return M
