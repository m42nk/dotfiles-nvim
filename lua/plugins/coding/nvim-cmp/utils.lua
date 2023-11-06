local M = {}

local cmp = require "cmp"

-- Behavior
-- Only expand when user select an entry
-- otherwise just send regular enter
M.handle_cr = function(fallback)
  if cmp.visible() and cmp.get_active_entry() then
    cmp.confirm { select = false }
  else
    fallback()
  end
end

M.handle_tab = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end

M.handle_s_tab = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end



return M
