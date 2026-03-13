-- (function()
--   local current_file_path = debug.getinfo(1).source:match "@(.*)$" or "."
--   local current_file_dir_path = vim.fn.fnamemodify(current_file_path, ":h")
--   local config_path = vim.fn.stdpath "config"
--
--   current_file_dir_path = vim.fn.resolve(current_file_dir_path)
--   config_path = vim.fn.resolve(config_path)
--
--   local file_paths = vim.fn.globpath(current_file_dir_path, "*", true, true)
--   for _, file_path in ipairs(file_paths) do
--     if vim.fn.resolve(file_path) == vim.fn.resolve(current_file_path) then
--       goto continue
--     end
--
--     local modname = file_path:gsub(config_path, "")
--     modname = modname:gsub("^/lua", "")
--     modname = modname:gsub(".lua$", "")
--     modname = modname:sub(2)
--
--     require(modname)
--
--     ::continue::
--   end
-- end)()

local specs = require("m42nk.requireall").requireall()
return specs
