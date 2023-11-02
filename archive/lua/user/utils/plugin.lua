local M = {}

M.bootstrap_lazy = function()
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    vim.notify "Lazy.nvim not found, installing..."
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    }
  end

  vim.opt.rtp:prepend(lazypath)
end

M.setup = function()
  require("lazy").setup {
    spec = {
      -- Custom plugins stored in lua/user/plugins
      { import = "user.plugins" },
    },
    defaults = {
      lazy = false,
      -- always use the latest git commit
      version = false,
      -- try installing the latest stable version for plugins that support semver
      -- version = "*",
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          -- "matchit",
          -- "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  }
end

----------------------------------------------------------
-- Check whether the given executables are installed on,
-- the system.
---@param executables string[] The executables to check.
---@param required_by string The plugin that requires the executables.
-----------------------------------------------------------
M.has_executables = function(executables, required_by)
  local missing = {}
  for _, executable in pairs(executables) do
    if vim.fn.executable(executable) ~= 1 then
      table.insert(missing, executable)
    end
  end

  if #missing == 0 then
    return true
  end

  vim.api.nvim_echo({
    {
      required_by
        .. ": missing executables `"
        .. table.concat(missing, ", ")
        .. "`.\n",
      "ErrorMsg",
    },
  }, true, {})

  -- Wait for user input to continue.
  vim.fn.getchar()
  return false
end

return M
