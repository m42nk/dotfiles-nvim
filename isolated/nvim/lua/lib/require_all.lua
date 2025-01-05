local M = {}

local get_caller_paths = function()
  -- f level 0 is the current function (`getinfo` itself);
  -- f level 1 is the function that called `getinfo`;
  -- and so on
  local f = 3
  local info = debug.getinfo(f, "S")

  -- remove the first char of the source path, because it starts with `@`
  local filepath = info.source:sub(2)

  return {
    filepath = filepath,
    dirpath = vim.fs.dirname(filepath),
  }
end

-- Convert a filepath to a module name.
-- For example, `/home/user/.config/nvim/lua/modules/requireall/init.lua`
-- will be converted to `modules/requireall`
local filepath_to_modulename = function(filepath)
  local config_path = vim.fn.stdpath("config")
  local modulename = filepath:gsub(config_path, "") -- remove the prefix path
  modulename = modulename:gsub("^/lua", "") -- remove the `/lua` prefix
  modulename = modulename:gsub(".lua$", "") -- remove the `.lua` suffix
  modulename = modulename:sub(2) -- remove the leading `/`
  return modulename
end

local get_files_and_dirs = function(dirpath, level)
  local files = {}

  local function scan_dir(path, current_level)
    if current_level > level then
      return
    end

    local entries = vim.fn.readdir(path)
    if not entries then
      return
    end

    for _, entry in ipairs(entries) do
      local fullpath = path .. "/" .. entry
      local is_directory = vim.fn.isdirectory(fullpath) == 1
      local init_lua_path = vim.fs.joinpath(fullpath, "init.lua")

      if is_directory and vim.uv.fs_stat(init_lua_path) then
        table.insert(files, fullpath)
      elseif is_directory then
        scan_dir(fullpath, current_level + 1)
      else
        table.insert(files, fullpath)
      end
    end
  end

  scan_dir(dirpath, 1)
  return files
end

-- Require all modules in the same directory as the caller.
-- Usually used in the `init.lua` file of a module
-- to automatically load all modules in the same directory
---@param level? number
M.require_all = function(level)
  local caller_paths = get_caller_paths()
  local modules = {}

  ---@type string[]
  local files = get_files_and_dirs(caller_paths.dirpath, level or 1)

  for _, file in ipairs(files) do
    -- skip current file, after resolving symlinks
    if vim.uv.fs_realpath(file) ~= vim.uv.fs_realpath(caller_paths.filepath) then
      local modname = filepath_to_modulename(file)
      local mod = require(modname)
      table.insert(modules, mod)
    end
  end

  return modules
end

-- Return a list of files in a directory recursively down to a certain level (depth).
--- @param dirpath string: The directory path
--- @param level? number: The depth level to scan
M.get_files = function(dirpath, level)
  local files = {}

  local function scan_dir(path, current_level)
    if current_level > level then
      return
    end
    local entries = vim.fn.readdir(path)
    if not entries then
      return
    end

    for _, entry in ipairs(entries) do
      local fullpath = path .. "/" .. entry
      if vim.fn.isdirectory(fullpath) == 1 then
        scan_dir(fullpath, current_level + 1)
      else
        table.insert(files, fullpath)
      end
    end
  end

  scan_dir(dirpath, 1)
  return files
end

return M
