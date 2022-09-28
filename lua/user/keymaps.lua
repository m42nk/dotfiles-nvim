-----------------------
-- Base keymaps
-----------------------

-----------------------
-- Tmux Keymaps
-----------------------

local keymap = vim.keymap.set
local tmux_nav = require("user.utils.tmux-integration").tmux_nav
local k = require "user.utils.keymaps"
local packer_install = function()
  require("packer").clean()
  require("packer").install()
end

k.map {
  ["<C-w>h"] = { tmux_nav "h", "Focus left" },
  ["<C-w>l"] = { tmux_nav "l", "Focus right" },
  ["<C-w>j"] = { tmux_nav "j", "Focus bottom" },
  ["<C-w>k"] = { tmux_nav "k", "Focus left" },
}

k.imap("jk", "<esc>", "Normal mode")
k.nmap("<c-q>", "<cmd>QuickFixToggle<cr>", "Toggle quickfix list")
k.nmap("<leader>ps", packer_install, "Clean and install new packer plugin")

k.nmap("[q", "<cmd>cprev<cr>", "Previous entry in qflist")
k.nmap("]q", "<cmd>cnext<cr>", "Next entry in qflist")

k.nmap("<leader><space>", "<cmd>:w<cr>", "Save file")

k.nmap {
  ["<leader><bslash>"] = {
    name = "Config",
    i = {
      "<cmd>e ~/.config/nvim/init.lua<cr>",
      "edit init.lua",
    },
    u = {
      "<cmd>e ~/.config/nvim/user/<cr>",
      "edit user",
    },
    p = {
      "<cmd>e ~/.config/nvim/lua/user/plugins.lua<cr>",
      "edit plugins.lua",
    },
    c = {
      "<cmd>e ~/.config/nvim/plugins/<cr>",
      "edit plugins",
    },
  },
}

k.nmap("<leader>h", "<cmd>nohlsearch<cr>", "Remove highlight")
k.nmap("<esc>", "<cmd>nohlsearch<cr>", "Remove highlight")

-- Don't jump to next match on * or #
k.nmap("*", "<cmd>keepjumps normal! mi*`i<cr>", "Highlight/jump next match")
k.nmap("#", "<cmd>keepjumps normal! mi#`i<cr>", "Highlight/jump prev match")

k.vmap("<", "<gv", "Remove indent")
k.vmap(">", ">gv", "Add indent")
