local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

-- Defaults: https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
wk.setup {}
