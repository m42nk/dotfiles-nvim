local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    {
      "LazyVim/LazyVim",
      version = "^14.15.0",
      import = "lazyvim.plugins",
      opts = function()
        local colorscheme = "fluoromachine" -- default colorscheme

        -- -- exec shell
        -- local handle = io.popen "sh -c defaults read -g AppleInterfaceStyle 2>/dev/null"
        -- vim.notify "geming"
        -- if handle then
        --   local is_dark_mode = handle:read("*a"):match "^%s*(.-)%s*$" == "Dark"
        --   if not is_dark_mode then
        --     colorscheme = "tokyonight-day"
        --   end
        --   handle:close()
        -- end

        return {
          colorscheme = colorscheme,
        }
      end,
    },

    { "nvim-neotest/nvim-nio" },
    { "nvim-lua/plenary.nvim" },

    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  }, -- automatically check for plugin updates
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
