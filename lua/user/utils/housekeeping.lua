local plugin = require "user.utils.plugin"
local M = {}

local _check_version = function()
  if vim.fn.has "nvim-0.9.0" == 0 then
    vim.api.nvim_echo({
      { "LazyVim requires Neovim >= 0.9.0\n", "ErrorMsg" },
      { "Press any key to exit", "MoreMsg" },
    }, true, {})
    vim.fn.getchar()
    vim.cmd [[quit]]
    return {}
  end
end

-- NOTE: Checking executable should probably done
-- in each plugins that require them.
local _check_required_executables = function()
  local executables = { "rg", "fd" }

  for _, executable in pairs(executables) do
    if vim.fn.executable(executable) ~= 1 then
      vim.api.nvim_echo({
        {
          string.format(
            "Required executable `%s` not found in PATH\n",
            executable
          ),
          "ErrorMsg",
        },
        {
          "Press any key to continue",
          "MoreMsg",
        },
      }, true, {})

      vim.fn.getchar()
    end
  end
end

M.bootstrap = function()
  _check_version()
  plugin.bootstrap_lazy()
  -- _check_required_executables()
end

return M
