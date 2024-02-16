local Util = require "lazyvim.util"
local M = {}

-- NOTE: use `normalize` instead of `joinpath` since its not available in 0.9.4
-- local lazy_path = vim.fs.normalize(tostring(vim.fn.stdpath "data") .. "/lazy" .. "/LazyVim")
-- local lazy_path = vim.fs.joinpath(tostring(vim.fn.stdpath "data"), "lazy", "LazyVim")

local data_path = tostring(vim.fn.stdpath "data") -- $HOME/.local/share/nvim

function M.lazyvim_files()
  local lazy_path = vim.fs.joinpath(data_path, "lazy", "LazyVim")
  return Util.telescope("find_files", { cwd = lazy_path })
end

function M.lazyvim_tree()
  local path = vim.fs.joinpath(data_path, "lazy", "LazyVim")
  return function()
    require("neo-tree.command").execute {
      action = "focus",
      source = "filesystem",
      dir = path,
    }
  end
end

function M.lazynvim_files()
  local lazy_path = vim.fs.joinpath(data_path, "lazy", "lazy.nvim")
  return Util.telescope("find_files", { cwd = lazy_path })
end

function M.global_todo_files()
  return Util.telescope("find_files", {
    -- cwd = vim.fs.joinpath(tostring(os.getenv "HOME"), "Todos"),
    cwd = vim.fs.normalize(tostring(os.getenv "HOME") .. "/Todos"),
  })
end

return M
