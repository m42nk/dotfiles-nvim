local k = require("user.lib.keymap")

k.nmap(
  "<leader>s",
  ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  "Sed word under cursor",
  { silent = false }
)

k.nmap(
  "<leader>S",
  ":S/<C-r><C-w>/<C-r><C-w>/g<Left><Left>",
  "Sed word under cursor (case-aware)",
  { silent = false }
)

k.nmap("<c-a>", "<cmd>b#<cr>", "Alternate (last) buffer")

-- Quickfix
k.nmap("<c-q>", "<cmd>QuickFixToggle<cr>", "Toggle quickfix list")
k.nmap("[q", "<cmd>cprev<cr>", "Previous entry in qflist")
k.nmap("]q", "<cmd>cnext<cr>", "Next entry in qflist")

-- Shortcuts
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
      "<cmd>e ~/.config/nvim/lua/user/plugins/plugins.lua<cr>",
      "edit plugins.lua",
    },
    c = {
      "<cmd>e ~/.config/nvim/user/setups/<cr>",
      "edit plugins setup",
    },
  },
}
