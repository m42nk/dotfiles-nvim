-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = require("util.augroup").augroup

vim.api.nvim_create_autocmd("FileType", {
  group = augroup "man_positioning",
  pattern = { "help", "man" },
  callback = function()
    if vim.api.nvim_win_get_width(0) > 110 then
      vim.cmd.wincmd "L"
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt.formatoptions:remove "o"
  end,
})
