-- Add executable permission to current file
vim.keymap.set(
  "n",
  "<leader>cx",
  "<cmd>!chmod +x %:p<cr>",
  { desc = "Add executable permission to current file", silent = false }
)
