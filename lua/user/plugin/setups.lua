local load = function(modname)
  local ok = pcall(require, "user.plugin.setups." .. modname)
  if not ok then
    vim.schedule(function()
      vim.notify("SETUP: Failed to load: " .. modname, vim.log.levels.WARN)
    end)
    return
  end
end

load "auto-session"
load "autopairs"
-- load "bufferline"
load "code_runner"
load "colorizer"
load "comment"
load "cybu"
load "dashboard"
load "gitsigns"
load "iswap"
load "lastplace"
load "leap"
load "luasnip"
load "neo-tree"
load "neoscroll"
load "project"
load "readline"
load "telescope"
load "tpope"
load "typescript"
load "which-key"
load "mini.bufremove"
