local packagepaths = {
  vim.fn.stdpath "config" .. "/?/init.lua",
  vim.fn.stdpath "config" .. "/?.lua",
}

package.path = table.concat(packagepaths, ";") .. ";" .. package.path

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("", "<Space>", "<Nop>", {})

require "user.plugin-manager"
require "user.options"
require "user.lsp"
require "user.setups"
require "user.keymaps"

-- -- -- Remap for dealing with word wrap
-- -- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- -- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
