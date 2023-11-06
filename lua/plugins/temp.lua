-- NOTE :
-- This is a quickfix to make initial editing easier,
-- move this to proper file to the structure
-- TODO: Refactor

local Util = require("lazyvim.util")

-- Format
-- stylua:ignore
vim.keymap.set({ "n", "v" }, "<leader>lf", function() Util.format({ force = true }) end, { desc = "Format" })

-- Comment
vim.keymap.set({ "n", "v" }, "<leader>/", function()
  local mode = vim.api.nvim_get_mode()
  local cursor_row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local _, select_start_row, _, _ = unpack(vim.fn.getpos("v") or {})

  if mode.mode == "n" then
    require("mini.comment").toggle_lines(cursor_row, cursor_row)
  elseif mode.mode == "V" or mode.mode == "v" then
    local first = select_start_row < cursor_row and select_start_row or cursor_row
    local last = select_start_row > cursor_row and select_start_row or cursor_row

    require("mini.comment").toggle_lines(first, last)
  end
end, { desc = "Comment" })


return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false }
    }
  }
}
