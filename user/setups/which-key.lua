local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.setup {
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "[SPC]",
    ["<leader>"] = "[LEAD]",
    ["<Tab>"] = "[TAB]",
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
