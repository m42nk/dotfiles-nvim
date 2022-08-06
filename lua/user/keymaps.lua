-- Alias
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- stylua: ignore start
keymap("n",    "<C-Up>", "<cmd>resize -2<CR>",          opts)
keymap("n",  "<C-Down>", "<cmd>resize +2<CR>",          opts)
keymap("n",  "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)
-- stylua: ignore end

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Save
keymap("n", "<leader><leader>", "<cmd>w<cr>", opts)

-- Reload config
keymap("n", "<leader>r", "<cmd>R<cr>", opts)

-- Edit last buffer (alternate)
keymap("n", "<leader><bslash>", "<cmd>e #<cr>", opts)

-----------------------------------------------------
-- Plugins
-----------------------------------------------------

-- Packer
keymap("n", "<leader>ps", "<cmd>PackerSync<cr>", opts)

-- Buffers and Bufferline
-- stylua: ignore start
keymap("n", "<S-l>",         "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<S-h>",         "<cmd>BufferLineCyclePrev<cr>", opts)
keymap("n", "<leader>c",     "<cmd>bdelete<cr>",             opts)
keymap("n", "<leader><S-h>", "<cmd>BufferLineMovePrev<cr>",  opts)
keymap("n", "<leader><S-l>", "<cmd>BufferLineMoveNext<cr>",  opts)
-- stylua: ignore end

for i = 1, 5 do
  keymap("n", "<M-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", opts)
end

-- Easy Align
keymap("x", "ga", "<Plug>(EasyAlign)<CR>")
keymap("x", "<leader>lc", [[:'<,'>EasyAlign /--/<CR>]])

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n",  "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<CR>",  opts)
keymap("n", "<leader>tp", "<cmd>Telescope projects<CR>",   opts)
keymap("n", "<leader>tb", "<cmd>Telescope buffers<CR>",    opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- Colorizer
keymap("n", "<leader>C", "<cmd>ColorizerToggle<cr>")
