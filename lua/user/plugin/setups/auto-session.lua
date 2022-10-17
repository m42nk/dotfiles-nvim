local ok, autosession = pcall(require, "auto-session")
if not ok then
  return
end

autosession.setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
}

require("user.utils.keymaps").nmap {
  ["<c-s-s>"] = {
    name = "Session",
    ["l"] = { "<cmd>RestoreSession<cr>", "Load (restore) session" },
    ["s"] = { "<cmd>SaveSession<cr>", "Save session" },
    ["<CR>"] = {
      "<cmd>Telescope session-lens search_session<cr>",
      "Search session",
    },
  },
}
