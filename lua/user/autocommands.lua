local api = vim.api

local custom = api.nvim_create_augroup("CustomGroup", { clear = true })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = custom,
})

-- windows to close with "q"
api.nvim_create_autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "lspinfo" },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
  group = custom,
})

api.nvim_create_autocmd("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = custom,
})

api.nvim_create_autocmd("FileType", {
  pattern = {"fugitive", "git"},
  command = [[ nnoremap <buffer><silent> q :bwipeout<CR> ]],
  group = custom,
})
