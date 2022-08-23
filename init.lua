-- Improve startup time with impatient
pcall(require, "impatient")

local modules = {
  "settings",
  "packer",
  "colorscheme",
  "globals",
  "commands",
  "autocommands",

  "lsp",
  "cmp",

  "treesitter",
  "lualine",

  "keymaps",
}

for _, m in pairs(modules) do
  local ok, module = pcall(require, "user." .. m)

  if not ok then
    vim.notify("INIT: Failed to load module " .. m, vim.log.levels.WARN)
    vim.notify("ERROR: " .. module, vim.log.levels.WARN)
  end
end
