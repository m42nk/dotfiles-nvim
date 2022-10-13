-- local ok, _ = pcall(require, "mini")
-- if not ok then
--   return
-- end

-- require("mini.tabline").setup {}

require("mini.bufremove").setup {
  set_vim_settings = true,
}

-- require("mini.ai").setup {
--   -- TODO: can add function text object here
--   custom_textobjects = nil,

--   mappings = {
--     around = "a",
--     inside = "i",

--     around_next = "an",
--     inside_next = "in",
--     around_last = "al",
--     inside_last = "il",

--     goto_left = "g[",
--     goto_right = "g]",
--   },

--   n_lines = 50,

--   search_method = "cover_or_next",
-- }

-- USE: :lua MiniSession.*
require("mini.sessions").setup {
  -- Whether to read latest session if Neovim opened without file arguments
  autoread = true,

  -- Whether to write current session before quitting Neovim
  autowrite = true,

  -- Directory where global sessions are stored (use `''` to disable)
  directory = vim.fn.stdpath "data" .. "/session",

  -- File for local session (use `''` to disable)
  file = "",

  -- Whether to force possibly harmful actions (meaning depends on function)
  force = { read = false, write = true, delete = false },

  -- Hook functions for actions. Default `nil` means 'do nothing'.
  hooks = {
    -- Before successful action
    pre = { read = nil, write = nil, delete = nil },
    -- After successful action
    post = { read = nil, write = nil, delete = nil },
  },

  -- Whether to print session path after action
  verbose = { read = true, write = true, delete = true },
}

require("user.utils.keymaps").nmap {
  ["<leader>c"] = { "<cmd>bdelete<cr>", "Buffer close" },
  ["<leader>C"] = { "<cmd>bwipeout<cr>", "Buffer wipeout" },
}

local save_session = function()
  local project_path = vim.fn.getcwd()
  local sanitized = project_path:gsub("/", "%%")

  require("mini.sessions").write(sanitized, {})
end

require("user.utils.keymaps").nmap {
  ["<leader>S"] = {
    name = "Sessions",
    ["s"] = { save_session, "Buffer close" },
  },
}
