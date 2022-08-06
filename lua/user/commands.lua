package.loaded["user.commands"] = nil

local command = vim.api.nvim_create_user_command

-- Create file next to current file (sibling)
command("ES", function(opts)
  -- Get new filename from argument
  local target_name = opts.args

  -- Get directory name from current file
  local target_dir = vim.fn.expand "%:p:h"

  vim.cmd("e " .. target_dir .. "/" .. target_name)
end, { nargs = 1 })
--
-- Edit init.lua
command("EI", function()
  vim.cmd [[e $MYVIMRC]]
end, {})

-- Run PackerSync
command("PS", function(opts)
  vim.cmd [[PackerSync]]
end, { nargs = 0 })

-- Source current file
command("R", function()
  vim.cmd [[source %]]
  vim.notify("Sourced " .. vim.fn.expand "%")
end, {})

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
