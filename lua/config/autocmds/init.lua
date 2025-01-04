-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = require("util.augroup").augroup

-- Set Go file specific options
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "golang",
  pattern = { "go" },
  callback = function()
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})

-- Adjust window layout for help and man pages
-- Place these window on the right side
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "man_positioning",
  pattern = { "help", "man" },
  callback = function()
    if vim.api.nvim_win_get_width(0) > 110 then
      vim.cmd.wincmd "L"
    end
  end,
})

-- don't continue comments on new lines using o and O
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt.formatoptions:remove "o"
  end,
})

-- Highlight trailing whitespace except in certain file types
vim.api.nvim_create_autocmd({ "FileType", "InsertEnter", "InsertLeave" }, {
  group = augroup "trailing_whitespace",
  pattern = { "*" },
  callback = require("config.autocmds.trailing_whitespace").callback,
})

-- Set filetype for .yml.sample files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.yml.sample",
  command = "set filetype=yaml",
})

-- Hover on cursorhold (commented out)
-- vim.api.nvim_create_autocmd("CursorHold", {
--   pattern = { "*" },
--   group = augroup "cursor_hold_hover",
--   callback = function()
--     if require("cmp").visible() then
--       return
--     end
--
--     -- vim.api.nvim_command "set eventignore=CursorHold"
--     -- vim.api.nvim_command 'autocmd CursorMoved ++once set eventignore=" " '
--     vim.lsp.buf.hover()
--   end,
-- })
