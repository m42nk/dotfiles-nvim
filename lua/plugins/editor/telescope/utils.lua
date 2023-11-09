local Util = require "lazyvim.util.telescope"
local M = {}

function M.lazyvim_files()
  local lazy_path = vim.fs.joinpath(tostring(vim.fn.stdpath "data"), "lazy", "LazyVim")
  return Util.telescope("find_files", { cwd = lazy_path })
end

function M.lazynvim_files()
  local lazy_path = vim.fs.joinpath(tostring(vim.fn.stdpath "data"), "lazy", "lazy.nvim")
  return Util.telescope("find_files", { cwd = lazy_path })
end

function M.global_todo_files()
  return Util.telescope("find_files", {
    cwd = vim.fs.joinpath(tostring(os.getenv "HOME"), "Todos"),
  })
end

return M
