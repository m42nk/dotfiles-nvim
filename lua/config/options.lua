-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.colorcolumn = "80" -- add visual border for column 80
opt.swapfile = false -- Don't use swapfile
opt.clipboard:remove "unnamedplus" -- don't use system clipboard
-- opt.spelllang = "en,id"
