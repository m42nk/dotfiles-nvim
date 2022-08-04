-- [[
-- Add `E` command to create file next to current file
-- Author: github.com/syakhisk
-- ]]

local command = vim.api.nvim_create_user_command

command("E", function(opts)
  -- Get new filename from argument
  local target_name = opts.args

  -- Get directory name from current file
  local target_dir = vim.fn.expand "%:p:h"

  vim.cmd("e " .. target_dir .. "/" .. target_name)
end, { nargs = 1 })

vim.cmd [[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
]]
