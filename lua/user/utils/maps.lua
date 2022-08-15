local M = {}

-- Modes: (:h map-table)
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

local function merge(desc, opts)
  local _opts = { unpack(opts) }
  _opts = vim.tbl_deep_extend("force", { desc = desc }, opts) or {}
  return _opts
end

M.map = function(mode, key, action, opts)
  vim.keymap.set(mode, key, action, opts)
end

M.label = function(mode, key, desc)
  vim.keymap.set(mode, key, "", { desc = desc })
end

M.nmap = function(key, action, desc, opts)
  opts = opts or {}
  M.map("n", key, action, merge(desc, opts))
end

M.imap = function(key, action, desc, opts)
  opts = opts or {}
  M.map("i", key, action, merge(desc, opts))
end

M.vmap = function(key, action, desc, opts)
  opts = opts or {}
  M.map("v", key, action, merge(desc, opts))
end

M.xmap = function(key, action, desc, opts)
  opts = opts or {}
  M.map("x", key, action, merge(desc, opts))
end

M.smap = function(key, action, desc, opts)
  opts = opts or {}
  M.map("s", key, action, merge(desc, opts))
end

return M
