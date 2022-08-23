-----------------------
-- Base keymaps
-----------------------

-----------------------
-- Tmux Keymaps
-----------------------

local keymap = vim.keymap.set
local tmux_nav = require("user.utils.tmux-integration").tmux_nav

keymap("n", "<C-w>h", tmux_nav "h", { desc = "Focus left" })
keymap("n", "<C-w>l", tmux_nav "l", { desc = "Focus left" })
-- keymap("n", "<C-w>j", tmux_nav "j", {})
-- keymap("n", "<C-w>k", tmux_nav "k", {})
-- keymap("n", "<C-w>l", tmux_nav "l", {})

vim.keymap.set("n", "<space>/", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("v", "<space>/", "<Plug>(comment_toggle_linewise_visual)")

-- Temporary keymap
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<leader>ps", function()
  require("packer").clean()
  require("packer").install()
end)

vim.keymap.set("n", "<leader>r", "<cmd>R<cr>")

vim.keymap.set("n", "<leader><leader>", "<cmd>:w<cr>")
vim.keymap.set("n", "<leader><leader>i", "<cmd>e ~/.config/nvim/init.lua<cr>")
vim.keymap.set("n", "<leader><leader>u", "<cmd>e ~/.config/nvim/lua/user/<cr>")
vim.keymap.set("n", "<leader><leader>p", "<cmd>e ~/.config/nvim/lua/user/plugins.lua<cr>")
vim.keymap.set("n", "<leader><leader>c", "<cmd>e ~/.config/nvim/plugin/<cr>")
vim.keymap.set("n", "<leader><tab>", "<cmd>bnext<cr>")
