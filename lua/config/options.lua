-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Disable autoformat
vim.g.autoformat = false

vim.g.root_spec = { ".git", "lsp", { "git", "lua" }, "cwd" }

opt.expandtab = true -- Use spaces instead of tabs
opt.colorcolumn = "100" -- "80" -- add visual border for column 80
opt.swapfile = false -- Don't use swapfile
opt.clipboard:remove "unnamedplus" -- don't use system clipboard
opt.splitbelow = true -- Put new windows below current

opt.updatetime = 1000 -- CursorHold

-- opt.relativenumber = false -- Let's try disabling relnu as it disorents people who see my screen
-- opt.relativenumber = true -- Let's try disabling relnu as it disorents people who see my screen

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

-- opt.listchars = opt.listchars + "tab:>>>"
opt.listchars:append {
  -- tab = "<->"
  -- tab = ">>"
  tab = "  ",
  -- tab = "..",
}

-- opt.sessionoptions = {
--   "buffers",
--   "curdir",
--   "tabpages",
--   "winsize",
--   "help",
--   "globals",
--   "skiprtp",
--   "folds",
--   -- "options"
-- }

-- opt.spelllang = "en,id"

------@param ev vim.api.create_autocmd.callback.args
---local localopts = function(ev)
---  local bufnr = ev.buf
---  local isfile = vim.bo[bufnr].buftype == ""
---
---  if not isfile then
---    return
---  end
---
---  local opts = {
---    scroll = 15,
---  }
---
---  local winid = vim.api.nvim_get_current_win()
---
---  for k, v in pairs(opts) do
---    vim.wo[winid][k] = v
---  end
---end
---
---vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
---  pattern = "*",
---  callback = localopts,
---  group = vim.api.nvim_create_augroup("local-options", { clear = true }),
---})
