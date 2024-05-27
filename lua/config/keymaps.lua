-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--
-- Remove lazyvim keymaps
--
-- Terminal mode
vim.keymap.del("t", "<c-l>")

-- Remove window navigation
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

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
local _togglePaneSize = function()
  if vim.g._pane_maximized == true then
    vim.g._pane_maximized = false
    vim.cmd "wincmd ="
  else
    vim.g._pane_maximized = true
    vim.cmd "wincmd |"
  end
end
vim.keymap.set("n", "<c-w><Enter>", _togglePaneSize, { desc = "Toggle maximize/equal panes" })

-- Format
-- set up Format and <leader>cf commands which should behave equivalently
vim.keymap.set("", "<leader>lf", function()
  require("conform").format { async = true, lsp_fallback = true, force = true }
  -- Util.format { force = true }
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, true, true), "n", true)
end)

-- Git Root Directory
-- stylua: ignore
vim.keymap.set("n", "<leader>gr", function() vim.cmd("CdGitRoot") end, { desc = "Change to git root directory" })

-- TODO: Map operator, this one is wrong
-- g=if should format function
-- vim.keymap.set("o", "g=", function()
--   Util.format { force = true }
-- end, { desc = "Format" })

-- Alternate last buffer
-- stylua: ignore
local _alternate = function() vim.cmd.b "#" end
vim.keymap.set("n", "<c-a>", _alternate, { desc = "Alternate (last) buffer" })

-- Toggle bufferline
-- stylua: ignore
local _toggle_bufferline = function() vim.opt.showtabline = vim.opt.showtabline:get() ~= 0 and 0 or 2 end
vim.keymap.set("n", "<leader>ub", _toggle_bufferline, { desc = "Toggle bufferline" })

-- Close windowless buffers
-- stylua: ignore
vim.keymap.set("n", "<leader>bD", "<cmd>CloseWindowlessBuffers<cr>", { desc = "Close hidden buffer (not visible in window)" })

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
vim.keymap.set("n", "<leader>gty", function()
  require("toolbox").copy_to_clipboard()
end, {desc = "Copy current line location in GoLand URL"})

vim.keymap.set("n", "<leader>gto", function()
  require("toolbox").open_in_toolbox()
end, {desc = "Open current line location in GoLand URL"})

vim.keymap.set("n", "<leader>g<Enter>", function()
  require("toolbox").open_in_toolbox()
end, {desc = "Open current line location in GoLand URL"})

-- Folds
-- Top level fold
vim.api.nvim_create_user_command("FoldTopLevelClose", function()
  vim.cmd "%foldclose"
end, {})

vim.api.nvim_create_user_command("FoldTopLevelOpen", function()
  vim.cmd "%foldopen"
end, {})

vim.keymap.set("n", "Zz", "<cmd>FoldTopLevelClose<cr>", { desc = "Close all toplevel folds" })
vim.keymap.set("n", "Zo", "<cmd>FoldTopLevelOpen<cr>", { desc = "Open all toplevel folds" })
