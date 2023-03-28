local navigate = require("user.tmux-navigation.lib").navigate

require("user.lib.keymap").map {
  ["<C-w>h"] = { navigate "h", "Focus left" },
  ["<C-w>l"] = { navigate "l", "Focus right" },
  ["<C-w>j"] = { navigate "j", "Focus bottom" },
  ["<C-w>k"] = { navigate "k", "Focus left" },
}
