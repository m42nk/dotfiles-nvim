local k = require "user.utils.keymap-helper"
local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local action_layout = require "telescope.actions.layout"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

local toggle_select_next = function(num)
  actions.toggle_selection(num)
  actions.move_selection_next(num)
end

local toggle_select_prev = function(num)
  actions.toggle_selection(num)
  actions.move_selection_previous(num)
end

telescope.setup {}
-- local cmd = k.cmd

k.map {
  -- ["<c-p>"] = { "<cmd>Telescope find_files<CR>", "Find files" },
  -- ["<c-n>"] = { "<cmd>Telescope buffers<CR>", "Show buffer list" },
  ["<leader>f"] = { builtin.find_files, "Find files" },
  ["<leader>b"] = { builtin.buffers, "Find files" },
  ["<leader>t"] = {},
}
