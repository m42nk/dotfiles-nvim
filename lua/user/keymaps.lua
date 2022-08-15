-- Alias
local m = require "user.utils.maps"
local nmap, vmap, imap, xmap = m.nmap, m.vmap, m.imap, m.xmap
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "

-- Better window navigation
nmap("<C-h>", "<C-w>h", "Window left")
nmap("<C-j>", "<C-w>j", "Window below")
nmap("<C-k>", "<C-w>k", "Window above")
nmap("<C-l>", "<C-w>l", "Window right")

-- Tmux integration
local tmux_nav = function(dir)
  return function()
    require("user.utils.tmux-aware-nav").navigate(dir)
  end
end

keymap("n", "<C-w>h", tmux_nav "h", {})
keymap("n", "<C-w>j", tmux_nav "j", {})
keymap("n", "<C-w>k", tmux_nav "k", {})
keymap("n", "<C-w>l", tmux_nav "l", {})

-- Clear highlights
nmap("<leader>h", "<cmd>nohlsearch<CR>", "Remove highlight")
nmap("<Esc>", "<cmd>nohlsearch<CR>", "Remove highlight")

-- Don't jump to next match on * or #
nmap("*", "<cmd>keepjumps normal! mi*`i<cr>", "Highlight/jump next match")
nmap("#", "<cmd>keepjumps normal! mi#`i<cr>", "Highlight/jump prev match")

-- Press jk fast to enter
imap("jk", "<ESC>", "Normal mode")

-- Stay in indent mode
vmap("<", "<gv", "Remove indent")
vmap(">", ">gv", "Add indent")

-- Save
nmap("<leader><leader>", "<cmd>w<cr>", "Save file")

-- Reload config
keymap("n", "<leader>r", function()
  local ft = vim.api.nvim_buf_get_option(0, "filetype")
  if ft == "lua" then
    vim.cmd [[R]]
  else
    vim.notify("Not a lua file", vim.log.levels.WARN)
  end
end, {})

-- Edit last buffer (alternate)
nmap("<leader><bslash>", "<C-^>", "Last buffer")
nmap("<C-Space>", "<C-^>", "Last buffer")

-- map Q to use blackhole register (not overriding clipboard)
-- Qp will not put replaced text in clipboard, etc
keymap({ "x", "n" }, "Q", '"_', {})

-- Better paste
vmap("p", '"_dP', "Don't put replaced text in register")

-- Same as above but for paste in visual block mode
xmap("p", "P", "Don't put replaced text in register")

-- Map % to gO, because bruh
nmap("gO", "%", "Jump to matching pair")

-----------------------------------------------------
-- Plugins
-----------------------------------------------------

-- Packer
-- keymap("n", "<leader>ps", "<cmd>PackerSync<cr>", {})
nmap("<leader>ps", require("user.utils").i_hate_packersync, "Packer Sync")

-- Mini
nmap("<leader>c", "<cmd>lua require('mini.bufremove').delete(0)<cr>", "Close buffer")

-- Fugitive
nmap("<leader>G", "<cmd>0Git<cr>", "Open fugitve status")
nmap("<bslash>g", "<cmd>0Git<cr>", "Open fugitve status")

-- Surround
-- simulate `ys` with <leader>s
nmap("<leader>s", "<plug>Ysurround", "Surround object")
nmap("<leader>ss", "<plug>Yssurround", "Surround line")

-- Buffers and Bufferline
nmap("<S-h>", "<cmd>BufferLineCyclePrev<cr>", "Buffer lef")
nmap("<S-l>", "<cmd>BufferLineCycleNext<cr>", "Buffer right")

nmap("<leader><S-h>", "<cmd>BufferLineMovePrev<cr>", "Swap buffer left")
nmap("<leader><S-l>", "<cmd>BufferLineMoveNext<cr>", "Swap buffer right ")

for i = 1, 5 do
  nmap("<M-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", "Buffer " .. i)
end

-- Easy Align
xmap("ga", "<Plug>(EasyAlign)<CR>", "Easy Align")
xmap("<leader>lc", [[:'<,'>EasyAlign /--/<CR>]], "Align lua comment")

-- Neo Tree
nmap("<leader>e", "<cmd>Neotree float reveal toggle<CR>", "Neotree")
nmap("<leader>E", "<cmd>Neotree float reveal_force_cwd<CR>", "Neotree force cwd")

-- Telescope
-- TODO: add telescope to browsed combined dotfiles
--[[ m.label("n", "<leader>t", "Telescope") ]]
nmap("<leader>t", "<nop>", { desc = "telescope" })
nmap("<leader>tt", "<cmd>Telescope<CR>", "List actions")
nmap("<leader>tr", "<cmd>Telescope resume<CR>", "Resume")
nmap("<leader>f", "<cmd>Telescope find_files<CR>", "Files")
nmap("<leader>tl", "<cmd>Telescope live_grep<CR>", "Search text")
nmap("<leader>tP", "<cmd>Telescope projects<CR>", "Projects")
nmap("<leader>tb", "<cmd>Telescope buffers<CR>", "Buffers")
nmap("<leader>tj", "<cmd>Telescope jumplist<CR>", "Jumplist")
nmap("<leader>tm", "<cmd>Telescope man_pages<CR>", "Man pages")
nmap("<leader>th", "<cmd>Telescope help_tags<CR>", "Help pages")
nmap("<leader>t!", "<cmd>Telescope command_history<CR>", "Command history")
nmap("<leader>tp", require("user.utils").telescope_find_configs, "Find configs")
nmap("<leader>tn", require("user.utils").telescope_find_notes, "Find notes")

-- Comment
-- TODO: fix this, make it more readable
-- probably with lua function
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", {})
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Colorizer
keymap("n", "<leader>C", "<cmd>ColorizerToggle<cr>")

-- Iswap
-- Swap nodes (function params, values, etc)
keymap("n", "<leader>mc", "<cmd>ISwap<CR>", {})
keymap("n", "<leader>mw", "<cmd>ISwapWith<CR>", {})

-- Gitsigns
keymap("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", {})
keymap("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", {})

-- Luasnip
-- TODO: move this probably
keymap({ "s", "n", "i", "v", "x" }, "<c-l>", function()
  local luasnip = require "luasnip"
  if luasnip.jumpable(1) then
    return luasnip.jump(1)
  else
    return "<c-w>l"
  end
end, { expr = true, noremap = false })

keymap({ "s", "n", "i", "v", "x" }, "<c-h>", function()
  local luasnip = require "luasnip"
  if luasnip.jumpable(-1) then
    print(luasnip.jumpable(-1))
    return luasnip.jump(-1)
  else
    return "<c-w>h"
  end
end, { expr = true, noremap = false })
