return {}
-- local Util = require "lazyvim.util"
--
-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     opts = function()
--       -- PERF: we don't need this lualine require madness 🤷
--       local lualine_require = require "lualine_require"
--       lualine_require.require = require
--
--       vim.o.laststatus = vim.g.lualine_laststatus
--
--       -- NOTE: components need to be imported here to wait for hlgroup to be loaded
--       local C = require "plugins.ui.lualine.components"
--
--       return {
--         options = {
--           theme = "auto",
--           globalstatus = false,
--           disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
--           component_separators = { left = "", right = "" },
--           section_separators = { left = "", right = "" },
--           refresh = {
--             statusline = 1000,
--           },
--         },
--         sections = {
--           lualine_a = {
--             C.mode,
--           },
--           lualine_b = {
--             {
--               "branch",
--               fmt = function(str)
--                 local max_len = 10
--                 if #str > max_len then
--                   str = str:sub(1, max_len) .. "..."
--                 end
--                 return str
--               end,
--             },
--           },
--           lualine_c = {
--             Util.lualine.root_dir(),
--             C.diagnostics,
--             C.filetype,
--             Util.lualine.pretty_path { length = 5 },
--           },
--           lualine_x = {
--             C.statusline_command,
--             C.statusline_mode,
--             C.dap,
--             C.plugin_updates,
--             C.diff,
--             C.treesitter_status,
--             C.copilot,
--             {
--               function()
--                 return "Indent: " .. vim.o.tabstop .. "/" .. vim.o.shiftwidth
--               end,
--               on_click = function()
--                 vim.notify(
--                   "Shiftwidth: " .. vim.o.shiftwidth .. "\n" .. "Tabstop: " .. vim.o.tabstop,
--                   "info",
--                   { title = "Indent" }
--                 )
--               end,
--               color = Util.ui.fg "Comment",
--             },
--             {
--               function()
--                 local space_pat = [[\v^ +]]
--                 local tab_pat = [[\v^\t+]]
--                 local space_indent = vim.fn.search(space_pat, "nwc")
--                 local tab_indent = vim.fn.search(tab_pat, "nwc")
--                 local mixed = (space_indent > 0 and tab_indent > 0)
--                 local mixed_same_line
--                 if not mixed then
--                   mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
--                   mixed = mixed_same_line > 0
--                 end
--                 if not mixed then
--                   return ""
--                 end
--                 if mixed_same_line ~= nil and mixed_same_line > 0 then
--                   return "MI:" .. mixed_same_line
--                 end
--                 local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
--                 local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
--                 if space_indent_cnt > tab_indent_cnt then
--                   return "MI:" .. tab_indent
--                 else
--                   return "MI:" .. space_indent
--                 end
--               end,
--             },
--           },
--           lualine_y = {
--             C.python_env,
--             C.location,
--           },
--           lualine_z = {},
--         },
--         extensions = { "neo-tree", "lazy" },
--       }
--     end,
--   },
-- }
