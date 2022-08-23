local M = {}

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  vim.notify("ERROR: which-key is not installed", vim.log.levels.ERROR)
  vim.notify("ERROR: " .. wk, vim.log.levels.ERROR)
  return
end

M.map = wk.register

return M
