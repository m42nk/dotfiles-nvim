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

  { "n", "<leader>ft", "Terminal (root dir)" },
  { "n", "<leader>fT", "Terminal (CWD)" },

  { "n", "<leader>l", "Lazy" },
}

for _, key in ipairs(keysToDelete) do
  pcall(vim.keymap.del, key[1], key[2], { desc = key[3] })
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
  "<leader>Cr",
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
vim.keymap.set(
  "n",
  "<leader>gM",
  kUtil.projectCompareWithMaster,
  { desc = "Compare with master (neotree & gitsigns change base)" }
)
vim.keymap.set(
  "n",
  "<leader>gC",
  kUtil.projectCompareWith,
  { desc = "Compare with commit/branch (neotree & gitsigns change base)" }
)

-- Alternate last buffer
vim.keymap.set("n", "<c-a>", kUtil.bufferAlternate, { desc = "Alternate (last) buffer" })

-- Toggle bufferline
vim.keymap.set("n", "<leader>ub", kUtil.bufferlineToggle, { desc = "Toggle bufferline" })

-- Close windowless buffers
--stylua: ignore
vim.keymap.set( "n", "<leader>bD", "<cmd>CloseWindowlessBuffers<cr>", { desc = "Close hidden buffer (windowless)" })

-- Close window and buffer (buffer unload)
--stylua: ignore
vim.keymap.del("n", "<leader>bb")
vim.keymap.set(
  "n",
  "<leader>bb",
  kUtil.splitsCloseAndBufferUnload,
  { desc = "Unload buffer (close buffer and window)" }
)

-- Save
vim.keymap.set("n", "<leader><space>", vim.cmd.w, { desc = "Save file" })

-- tmux integration, fallback tmux navigation if nvim split is on edge
vim.keymap.set("n", "<c-w>h", require("util.tmux").navigate "h")
vim.keymap.set("n", "<c-w>j", require("util.tmux").navigate "j")
vim.keymap.set("n", "<c-w>k", require("util.tmux").navigate "k")
vim.keymap.set("n", "<c-w>l", require("util.tmux").navigate "l")

-- Grep
vim.keymap.set("n", "gG", kUtil.projectGrepWithContext, { desc = "Go to line" })

-- -- Buffer navigation
-- vim.keymap.set("n", "gG", kUtil.goToLine(), { desc = "Go to line" })

-- Line number
vim.keymap.del("n", "<leader>ul")
vim.keymap.del("n", "<leader>uL")

-- TODO:uncomment
-- LazyVim.toggle.map("<leader>ul", LazyVim.toggle("relativenumber", { name = "Relative Number" }))
-- LazyVim.toggle.map("<leader>uL", LazyVim.toggle.number)

-- Emacs binding on insert mode (useful for insert mode like in nui.nvim input)
vim.keymap.set({ "i", "c" }, "<c-a>", "<Home>", { desc = "Move cursor to beginning of line" })
vim.keymap.set({ "i", "c" }, "<c-b>", "<Left>", { desc = "Move cursor to left" })
vim.keymap.set({ "i", "c" }, "<c-e>", "<End>", { desc = "Move cursor to end of line" })
vim.keymap.set({ "i", "c" }, "<c-f>", "<Right>", { desc = "Move cursor to right" })
vim.keymap.set({ "i", "c" }, "<m-b>", "<c-Left>", { desc = "Move cursor to left word" })
vim.keymap.set({ "i", "c" }, "<m-f>", "<c-Right>", { desc = "Move cursor to right word" })

-- Jetbrains Toolbox Golang URL
--stylua: ignore start
require("m42nk/toolbox").setup()
vim.keymap.set( "n", "<leader>gty", require("m42nk/toolbox").copy_to_clipboard, { desc = "Copy current line location in GoLand URL" })
vim.keymap.set( "n", "<leader>gto", require("m42nk/toolbox").open_in_toolbox, { desc = "Open current line location in GoLand URL" })
vim.keymap.set( "n", "<leader>g<Enter>", require("m42nk/toolbox").open_in_toolbox, { desc = "Open current line location in GoLand URL" })
--stylua: ignore end

-- Folds
vim.keymap.set("n", "Zz", kUtil.bufferFoldTopLevelClose, { desc = "Close all toplevel folds" })
vim.keymap.set("n", "Zo", kUtil.bufferFoldTopLevelOpen, { desc = "Open all toplevel folds" })
vim.keymap.set("n", "ZZ", "<cmd>setlocal foldlevel=0<cr>", { desc = "Close all folds recursively" })
vim.keymap.set("n", "ZO", "<cmd>setlocal foldlevel=99<cr>", { desc = "Open all folds recursively" })
-- vim.keymap.set("n", "ZA", kUtil.BufferFoldToggleRecursive, { desc = "Toggle all folds recursively" })

-- Super Escape
vim.keymap.set({ "i", "n" }, "<esc>", kUtil.superEscapeExpr, { expr = true, desc = "Escape and Clear hlsearch" })

-- Reopen closed buf
vim.keymap.set("n", "<leader>bu", require("m42nk/lastbuf").reopenLastClosedBuffer, { desc = "Reopen closed buffer" })

-- Save as root (doesn't work on mac)
vim.keymap.set("ca", "w!!", "w !sudo -A tee '%'", { desc = "Save file as root" })

-- Get filetype of current buffer
vim.keymap.set("n", "<leader>bf", kUtil.bufferGetFiletype, { desc = "Get filetype of current buffer" })
vim.keymap.set("n", "<leader>bF", kUtil.bufferSetFiletype, { desc = "Set filetype of current buffer" })

-- -- DELETEME: testing
-- vim.keymap.set("n", "<leader>rr", function()
--   kUtil.listReferencesByAccess "Read"
-- end, { desc = "List Read references" })
-- vim.keymap.set("n", "<leader>rw", function()
--   kUtil.listReferencesByAccess "Write"
-- end, { desc = "List Write references" })

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
