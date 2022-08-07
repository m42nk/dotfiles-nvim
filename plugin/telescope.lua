local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup {
  pickers = {
    find_files = {
      find_command = { "fd", "--hidden", "--type", "f" },
    },
  },
}

-- local pickers = require "telescope.pickers"
-- local finders = require "telescope.finders"
-- local conf = require("telescope.config").values
-- --[[
-- Pickers => telescope window to pick something
-- Finders => provider for list to be picked
-- Sorter => as the name suggest
-- --]]

-- -- our picker function: colors
-- local colors = function(opts)
--   opts = opts or {}
--   pickers.new(opts, {
--     prompt_title = "colors",
--     finder = finders.new_table {
--       results = { "red", "green", "blue" }
--     },
--     sorter = conf.generic_sorter(opts),
--   }):find()
-- end

-- -- to execute the function
-- -- colors()
-- colors(require("telescope.themes").get_dropdown{})
