local M = {}
M.toggle = function()
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
  -- vim.cmd.norm "\\<esc\\>"
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, true, true), "n", true)
end
return M
