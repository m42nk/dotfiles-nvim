local M = {}

-----------------------------------------------------------
-- Checks if running under Windows.
-----------------------------------------------------------
function M.is_win()
  ---@diagnostic disable-next-line: undefined-field
  return vim.loop.os_uname().version:match "Windows"
end

-----------------------------------------------------------
-- Function equivalent to basename in POSIX systems.
---@param str the path string.
-----------------------------------------------------------
function M.basename(str)
  return string.gsub(str, "(.*/)(.*)", "%2")
end

-----------------------------------------------------------
-- Contatenates given paths with correct separator.
---@param: var args of string paths to joon.
-----------------------------------------------------------
function M.join_paths(...)
  local path_sep = M.is_win() and "\\" or "/"
  local result = table.concat({ ... }, path_sep)
  return result
end

local _base_lua_path = M.join_paths(vim.fn.stdpath "config", "lua")

-----------------------------------------------------------
-- Loads all modules from the given package.
---@param package: name of the package in lua folder.
-----------------------------------------------------------
function M.glob_require(package)
  local glob_path = M.join_paths(_base_lua_path, package, "*.lua")

  for _, path in pairs(vim.split(vim.fn.glob(glob_path), "\n")) do
    -- convert absolute filename to relative
    -- ~/.config/nvim/lua/<package>/<module>.lua => <package>/foo
    local relfilename = path:gsub(_base_lua_path, ""):gsub("%.lua", "")
    local basename = M.basename(relfilename)
    -- skip `init` and files starting with underscore.
    if basename ~= "init" and basename:sub(1, 1) ~= "_" then
      require(relfilename)
    end
  end
end

-----------------------------------------------------------
-- Traverse and list all module (*.lua) and sub-module (*/init.lua) files in the
-- given directory, recursively.
---@param initial_module: name of the package in lua folder.
-----------------------------------------------------------
function M.find_submodules(initial_module)
  local modules = {}

  -- convert dot notation to path separator
  -- `user.plugins.ui` => `user/plugins/ui`
  local path_sep = M.is_win() and "\\" or "/"
  initial_module = initial_module:gsub("%.", path_sep)

  -- join the path with the base lua path
  -- `user/plugins/ui` => `~/.config/nvim/lua/user/plugins/ui`
  local glob_path = M.join_paths(_base_lua_path, initial_module, "**", "*.lua")

  for _, path in pairs(vim.split(vim.fn.glob(glob_path), "\n")) do
    -- convert absolute filename to relative
    -- ~/.config/nvim/lua/<package>/<module>.lua => <package>/foo
    local relfilename = path:gsub(_base_lua_path, ""):gsub("%.lua", "")
    local basename = M.basename(relfilename)

    -- Skip initial module
    local is_initial_module = relfilename == M.join_paths("", initial_module)
        or relfilename == M.join_paths("", initial_module, "init")

    -- skip `init` and files starting with underscore.
    if not is_initial_module and basename:sub(1, 1) ~= "_" then
      table.insert(modules, relfilename)
    end
  end

  return modules
end

-----------------------------------------------------------
-- Loads all submodules from the given package and join them into a table,
-- used for lazy.nvim plugin spec.
---@param submodules: name of the package in lua folder.
---@return table of submodules.
-----------------------------------------------------------
M.join_submodules_table = function(submodules)
  local result = {}

  for _, module in pairs(M.find_submodules(submodules)) do
    local ok, tbl = pcall(require, module)
    if ok then
      table.insert(result, tbl)
    end
  end

  return result
end

-----------------------------------------------------------
-- Callback when a plugin is loaded.
---@param name string
---@param fn fun(name:string)
---@return table of submodules.
-----------------------------------------------------------
function M.on_load(name, fn)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

return M

-- Resources:
-- https://github.com/grundic/vcsh-neovim-master/blob/50a84d3939b232fd63df6bd59c7f3d97495f968e/.config/nvim/lua/utils.lua
