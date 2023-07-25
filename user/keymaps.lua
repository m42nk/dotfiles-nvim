local k = require "user.utils.keymap-helper"
local nmap, cmd = k.nmap, k.cmd

-- Autohide highlight on cursor hold
-- -- vim.cmd [[
-- -- autocmd cursorhold * set nohlsearch
-- -- noremap n :set hlsearch<cr>n
-- -- noremap N :set hlsearch<cr>N
-- -- noremap / :set hlsearch<cr>/
-- -- noremap ? :set hlsearch<cr>?
-- -- ]]

-- TODO: tmux
nmap("<leader><space>", cmd "w", "Save file")
nmap("<c-s>", cmd "w", "Save file")
nmap("<leader>h", cmd "nohlsearch", "Remove highlight")
