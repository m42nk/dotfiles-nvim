local k = require("user.lib.keymap")

-- k.imap("jk", "<esc>", "Normal mode")
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
