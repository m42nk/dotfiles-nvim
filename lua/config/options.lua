-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Disable autoformat
vim.g.autoformat = false

vim.g.root_spec = { ".git", "lsp", { "git", "lua" }, "cwd" }

opt.colorcolumn = "80" -- add visual border for column 80
opt.swapfile = false -- Don't use swapfile
opt.clipboard:remove "unnamedplus" -- don't use system clipboard
opt.splitbelow = true -- Put new windows below current

--- cursor	Keep the same relative cursor position.
--- screen	Keep the text on the same screen line.
--- topline	Keep the topline the same.
-- opt.splitkeep = "screen"
opt.splitkeep = "cursor"
opt.splitright = true -- Put new windows right of current
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
-- opt.spelllang = "en,id"

