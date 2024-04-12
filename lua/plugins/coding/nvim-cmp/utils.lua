local M = {}

local cmp = require "cmp"

-- Behavior
-- Only expand when user select an entry
-- otherwise just send regular enter
M.handle_cr = function(fallback)
  if cmp.visible() and cmp.get_active_entry() then
    cmp.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace }
  else
    fallback()
  end
end

M.handle_tab = function(fallback)
  if cmp.visible() then
    -- HACK: this is a gopls workaround for when current text
    -- match exactly as one of the completion item, pressing tab
    -- will replace the text with the completion item + snippet gibberish
    vim.api.nvim_input("<Down>")
    -- cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
  else
    fallback()
  end
end

M.handle_s_tab = function(fallback)
  if cmp.visible() then
    vim.api.nvim_input("<Up>")
    -- cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
  else
    fallback()
  end
end

return M
