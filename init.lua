-- Improve startup time with impatient
pcall(require, "impatient")

local modules = {
  "settings",
  "packer",
  "colorscheme",
}

for _, m in pairs(modules) do
  local ok, loaded = pcall(require, "user." .. m)
  if not ok then
    vim.notify("INIT: Failed to load module " .. loaded, vim.log.levels.WARN)
  end
end
