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

return M
