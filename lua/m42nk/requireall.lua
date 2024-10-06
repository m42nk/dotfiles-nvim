local M = {}

M.requireall = function()
  -- level 0 is the current function (`getinfo` itself);
  -- level 1 is the function that called `getinfo`;
  -- and so on
  local level = 2

  local current_file_path = debug.getinfo(level).source:match "@(.*)$" or "."
  local current_file_dir_path = vim.fn.fnamemodify(current_file_path, ":h")
  local config_path = vim.fn.stdpath "config"

  current_file_dir_path = vim.fn.resolve(current_file_dir_path)
  config_path = vim.fn.resolve(config_path)

  local specs = {}

  local file_paths = vim.fn.globpath(current_file_dir_path, "*", true, true)
  for _, file_path in ipairs(file_paths) do
    if vim.fn.resolve(file_path) == vim.fn.resolve(current_file_path) then
      goto continue
    end

    local modname = file_path:gsub(config_path, "")
    modname = modname:gsub("^/lua", "")
    modname = modname:gsub(".lua$", "")
    modname = modname:sub(2)

    local mod = require(modname)

    table.insert(specs, mod)

    ::continue::
  end

  return specs
end

return M
