----------------------------------
-- Keymapping

-- Modes:
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",
----------------------------------

-- Alias
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = false }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Reselect pasted text
keymap("v", "gp", "<esc>`[v`]")

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

keymap("n", "*", "<cmd>keepjumps normal! mi*`i<cr>")
keymap("n", "#", "<cmd>keepjumps normal! mi#`i<cr>")

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
keymap("n", "<leader><bslash>", "<C-^>", opts)
keymap("n", "<C-Space>", "<C-^>", opts)

-- map Q to use blackhole register (not overriding clipboard)
-- Qp will not put replaced text in clipboard, etc
keymap({ "x", "n" }, "Q", '"_', opts)

-- Same as above but for paste in visual block mode
keymap("x", "p", "P", opts)

-----------------------------------------------------
-- Plugins
-----------------------------------------------------

-- Packer
-- keymap("n", "<leader>ps", "<cmd>PackerSync<cr>", opts)
keymap("n", "<leader>ps", require("user.utils").i_hate_packersync, opts)

-- Mini
keymap("n", "<leader>c", "<cmd>lua require('mini.bufremove').delete(0)<cr>", opts)

-- Fugitive
keymap("n", "<leader>G", "<cmd>0Git<cr>", opts)
keymap("n", "<bslash>g", "<cmd>0Git<cr>", opts)

-- Surround
-- simulate `ys` with <leader>s
keymap("n", "<leader>s", "<plug>Ysurround", {})
keymap("n", "<leader>ss", "<plug>Yssurround", {})
-- keymap("v", "<leader>s", "<plug>Vsurround", {})
-- keymap("x", "<leader>ss", "<plug>Vssurround", {})

-- Buffers and Bufferline
-- stylua: ignore start
keymap("n", "<S-l>",         "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<S-h>",         "<cmd>BufferLineCyclePrev<cr>", opts)
keymap("n", "<leader><S-h>", "<cmd>BufferLineMovePrev<cr>",  opts)
keymap("n", "<leader><S-l>", "<cmd>BufferLineMoveNext<cr>",  opts)
-- stylua: ignore end

for i = 1, 5 do
  keymap("n", "<M-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", opts)
end

-- Easy Align
keymap("x", "ga", "<Plug>(EasyAlign)<CR>")
-- TODO: Make binding for specific filetype, this is for lua
keymap("x", "<leader>lc", [[:'<,'>EasyAlign /--/<CR>]])

-- NvimTree
-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Carbon - Tree Explorer
-- keymap("n", "<leader>e", "<cmd>Fcarbon<CR>", opts)

-- Neo Tree
-- [[[
-- keymap("n", "<leader>ee", "<cmd>Neotree position=float reveal toggle<CR>", opts)
-- keymap("n", "<leader>ef", "<cmd>Neotree position=float reveal toggle dir=%:p:h<CR>", opts)
-- keymap("n", "<leader>e", "<cmd>Neotree position=float reveal toggle dir=%:p:h<CR>", opts)
-- ]]]
keymap("n", "<leader>e", "<cmd>Neotree position=float reveal toggle<CR>", opts)

-- Telescope
keymap("n", "<leader>t<leader>", "<cmd>Telescope resume<CR>", opts)
keymap("n", "<leader>tt", "<cmd>Telescope<CR>", opts)
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>ts", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>tp", "<cmd>Telescope projects<CR>", opts)
keymap("n", "<leader>tb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>tj", "<cmd>Telescope jumplist<CR>", opts)
keymap("n", "<leader>tm", "<cmd>Telescope man_pages<CR>", opts)
keymap("n", "<leader>t!", "<cmd>Telescope command_history<CR>", opts)
keymap("n", "<leader>tn", require("user.utils").telescope_find_nvim_config, opts)

-- Comment
-- TODO: fix this, make it more readable
-- probably with lua function
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- Colorizer
keymap("n", "<leader>C", "<cmd>ColorizerToggle<cr>")

-- Iswap
-- Swap nodes (function params, values, etc)
keymap("n", "<leader>mc", "<cmd>ISwap<CR>", opts)
keymap("n", "<leader>mw", "<cmd>ISwapWith<CR>", opts)

-- Gitsigns
keymap("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", opts)

-- Luasnip
-- TODO: move this probably
keymap({ "s", "n", "i", "v", "x" }, "<c-l>", function()
  local luasnip = require "luasnip"
  if luasnip.jumpable(1) then
    return luasnip.jump(1)
  else
    return "<c-l>"
  end
end, { expr = true })

keymap({ "s", "n", "i", "v", "x" }, "<c-h>", function()
  local luasnip = require "luasnip"
  if luasnip.jumpable(-1) then
    return luasnip.jump(-11)
  else
    return "<c-h>"
  end
end, { expr = true })

-- Tree climber
-- do
--   local ok, treeclimber = pcall(require, "tree-climber")
--   if not ok then
--     return
--   end
--   local nvo = { "n", "v", "o" }
--   local vo = { "v", "o" }

--   keymap(nvo, "gtk", treeclimber.goto_parent, {})
--   keymap(nvo, "gtj", treeclimber.goto_child, {})
--   keymap(nvo, "<leader>gN", treeclimber.goto_next, {})
--   keymap(nvo, "<leader>gP", treeclimber.goto_prev, {})
--   keymap(vo, "n", treeclimber.select_node, {})
--   keymap("n", "<leader>gsp", treeclimber.swap_prev, {})
--   keymap("n", "<leader>gsn", treeclimber.swap_next, {})
-- end
