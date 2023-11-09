-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require "lazyvim.util"

-- Yank
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Copy to system clipboard" })

-- Paste
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from system clipboard" })

-- Delete
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete instead of cut" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"_D', { desc = "Delete instead of cut " })

-- Toggle comment
vim.keymap.set({ "n", "v" }, "<leader>/", require("util.comment").toggle, { desc = "Comment" })

-- Format
-- stylua: ignore
local _format = function() Util.format { force = true }
end
vim.keymap.set({ "n", "v" }, "<leader>lf", _format, { desc = "Format" })

-- Alternate last buffer
-- stylua: ignore
local _alternate = function() vim.cmd.b "#" end
vim.keymap.set("n", "<c-a>", _alternate, { desc = "Alternate (last) buffer" })

-- Toggle bufferline
-- stylua: ignore
local _toggle_bufferline = function() vim.opt.showtabline = vim.opt.showtabline:get() ~= 0 and 0 or 2 end
vim.keymap.set("n", "<leader>ub", _toggle_bufferline, { desc = "Toggle bufferline" })

-- Save
vim.keymap.set("n", "<leader><space>", vim.cmd.w, { desc = "Save file" })

-- tmux integration, fallback tmux navigation if nvim split is on edge
vim.keymap.set("n", "<c-w>h", require("util.tmux").navigate "h")
vim.keymap.set("n", "<c-w>j", require("util.tmux").navigate "j")
vim.keymap.set("n", "<c-w>k", require("util.tmux").navigate "k")
vim.keymap.set("n", "<c-w>l", require("util.tmux").navigate "l")

-- Emacs binding on insert mode (useful for insert mode like in nui.nvim input)
vim.keymap.set("i", "<c-a>", "<Home>", { desc = "Move cursor to beginning of line" })
vim.keymap.set("i", "<c-b>", "<Left>", { desc = "Move cursor to left" })
vim.keymap.set("i", "<c-e>", "<End>", { desc = "Move cursor to end of line" })
vim.keymap.set("i", "<c-f>", "<Right>", { desc = "Move cursor to right" })
vim.keymap.set("i", "<m-b>", "<c-Left>", { desc = "Move cursor to left word" })
vim.keymap.set("i", "<m-f>", "<c-Right>", { desc = "Move cursor to right word" })
