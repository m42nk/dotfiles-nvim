----------------------------------
-- Colorscheme
----------------------------------

-- local colorscheme = "tokyonight"
local colorscheme = "tokyodark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
