-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local kUtil = require "config.keymaps.utils"
--
-- Remove lazyvim keymaps
--
local keysToDelete = {
  { "t", "<c-l>", "Make <c-l> clear terminal instead of focusing back" },
  { "n", "<C-h>", "Move to the left window" },
  { "n", "<C-j>", "Move to the window below" },
  { "n", "<C-k>", "Move to the window above" },
  { "n", "<C-l>", "Move to the right window" },
}

for _, key in ipairs(keysToDelete) do
  vim.keymap.del(key[1], key[2], { desc = key[3] })
end

-- Yank
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Copy to system clipboard" })

-- Paste
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from system clipboard" })

-- Delete
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete instead of cut" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"_D', { desc = "Delete instead of cut " })

-- Delete marks
vim.keymap.set("n", "dm", "<cmd>execute 'delmarks '.nr2char(getchar())<cr>", { desc = "Delete mark" })

-- Toggle comment
vim.keymap.set({ "n", "v" }, "<leader>/", require("util.comment").toggle, { desc = "Comment" })

-- Smart case renaming for word under cursor
vim.keymap.set(
  "n",
  "<leader>cR",
  ":S/<c-r><c-w>//g<left><left>",
  { desc = "Rename word under cursor (smart case, abolish.vim)" }
)

-- Insert backtick (avoid triggering tmux prefix)
vim.keymap.set("i", "<c-q>", "`", { desc = "Insert backtick" })

-- Split pane (with new buffer)
vim.keymap.set("n", "<c-w>V", "<cmd>vnew<cr>", { desc = "Split right (new empty buffer)" })
vim.keymap.set("n", "<c-w>S", "<cmd>new<cr>", { desc = "Split down (new empty buffer)" })

-- Focus pane
vim.keymap.set("n", "<c-w><Enter>", kUtil.paneToggleSize, { desc = "Toggle maximize/equal panes" })

-- Format
-- set up Format and <leader>cf commands which should behave equivalently
vim.keymap.set("", "<leader>lf", kUtil.bufferFormat, { desc = "Format" })

--
-- Git
--
vim.keymap.set("n", "<leader>gr", kUtil.projectChangeToGitRoot, { desc = "Change to git root directory" })
vim.keymap.set("n", "<leader>gM", kUtil.projectCompareWithMaster, { desc = "Compare with master (neotree & gitsigns)" })

-- Alternate last buffer
vim.keymap.set("n", "<c-a>", kUtil.bufferAlternate, { desc = "Alternate (last) buffer" })

-- Toggle bufferline
vim.keymap.set("n", "<leader>ub", kUtil.bufferlineToggle, { desc = "Toggle bufferline" })

-- Close windowless buffers
--stylua: ignore
vim.keymap.set( "n", "<leader>bD", "<cmd>CloseWindowlessBuffers<cr>", { desc = "Close hidden buffer (not visible in window)" })

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

-- Jetbrains Toolbox Golang URL
--stylua: ignore
vim.keymap.set( "n", "<leader>gty", require("toolbox").copy_to_clipboard, { desc = "Copy current line location in GoLand URL" })

--stylua: ignore
vim.keymap.set( "n", "<leader>gto", require("toolbox").open_in_toolbox, { desc = "Open current line location in GoLand URL" })

--stylua: ignore
vim.keymap.set( "n", "<leader>g<Enter>", require("toolbox").open_in_toolbox, { desc = "Open current line location in GoLand URL" })

-- Folds
vim.keymap.set("n", "Zz", kUtil.bufferFoldTopLevelClose, { desc = "Close all toplevel folds" })
vim.keymap.set("n", "Zo", kUtil.bufferFoldTopLevelOpen, { desc = "Open all toplevel folds" })

-- Unmap lazyvim lazygit
-- map("n", "<leader>gg", function() LazyVim.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
-- map("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
-- map("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
--
-- map("n", "<leader>gf", function()
--   local git_path = vim.api.nvim_buf_get_name(0)
--   LazyVim.lazygit({args = { "-f", vim.trim(git_path) }})
-- end, { desc = "Lazygit Current File History" })
--
-- map("n", "<leader>gl", function()
--   LazyVim.lazygit({ args = { "log" } })
-- end, { desc = "Lazygit Log" })

-- TODO: Map operator, this one is wrong
-- g=if should format function
-- vim.keymap.set("o", "g=", function()
--   Util.format { force = true }
-- end, { desc = "Format" })
