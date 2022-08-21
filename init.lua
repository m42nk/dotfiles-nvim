-- Improve startup time with impatient
pcall(require, "impatient")

local modules = {
  "settings",
  "packer",
  "colorscheme",
  "globals",
  "lsp",
  "cmp",
}

for _, m in pairs(modules) do
  local ok, module = pcall(require, "user." .. m)

  if not ok then
    vim.notify("INIT: Failed to load module " .. m, vim.log.levels.WARN)
    vim.notify("ERROR: " .. module, vim.log.levels.WARN)
  end
end

-- Temporary keymap
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<space><space>i", "<cmd>e ~/.config/nvim/init.lua<cr>")
vim.keymap.set("n", "<space><space>u", "<cmd>e ~/.config/nvim/lua/user/<cr>")
vim.keymap.set("n", "<space><space>p", "<cmd>e ~/.config/nvim/lua/user/plugins.lua<cr>")
vim.keymap.set("n", "<space><space>c", "<cmd>e ~/.config/nvim/plugin/<cr>")
vim.keymap.set("n", "<space><tab>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<space>/", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("v", "<space>/", "<Plug>(comment_toggle_linewise_visual)")
