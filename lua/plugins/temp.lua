-- NOTE :
-- This is a quickfix to make initial editing easier,
-- move this to proper file to the structure
-- TODO: Refactor

local Util = require "lazyvim.util"

-- Format
-- stylua:ignore
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  Util.format { force = true }
end, { desc = "Format" })

-- Alternate last buffer
vim.keymap.set("n", "<c-a>", function()
  vim.cmd.b "#"
end, { desc = "Alternate (last) buffer" })

-- save
vim.keymap.set("n", "<leader><space>", vim.cmd.w)
vim.keymap.set("n", "<c-w>h", require("util.tmux").navigate "h")
vim.keymap.set("n", "<c-w>j", require("util.tmux").navigate "j")
vim.keymap.set("n", "<c-w>k", require("util.tmux").navigate "k")
vim.keymap.set("n", "<c-w>l", require("util.tmux").navigate "l")

-- Comment
vim.keymap.set({ "n", "v" }, "<leader>/", function()
  local mode = vim.api.nvim_get_mode()
  local cursor_row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local _, select_start_row, _, _ = unpack(vim.fn.getpos "v" or {})

  if mode.mode == "n" then
    require("mini.comment").toggle_lines(cursor_row, cursor_row)
  elseif mode.mode == "V" or mode.mode == "v" then
    local first = select_start_row < cursor_row and select_start_row or cursor_row
    local last = select_start_row > cursor_row and select_start_row or cursor_row

    require("mini.comment").toggle_lines(first, last)
  end

  -- HACK: find better way to unselect
  vim.cmd.norm "\\<esc\\>"
end, { desc = "Comment" })

-- TODO: move to hl file if needed
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1e1e1e", default = false })

-- Abbrevs
vim.cmd.cabbrev("Wq", "wq")
vim.cmd.cabbrev("Wqa", "wqa")
vim.cmd.cabbrev("W", "w")
vim.cmd.cabbrev("Q", "q")
vim.cmd.cabbrev("Qa", "qa")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
    },
  },
}
