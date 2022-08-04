local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require("user.lsp.mason").setup()
require "user.lsp.ui"
require "user.lsp.null-ls"
require "user.lsp.fidget"
