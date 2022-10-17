local required_modules = {
  "lspconfig",
  "mason",
  "mason-lspconfig",
  "mason-tool-installer",
  "null-ls",
}

for _, m in pairs(required_modules) do
  local ok, module = pcall(require, m)
  if not ok then
    vim.notify("USER.LSP: Failed to load module " .. m, vim.log.levels.ERROR)
    vim.notify("ERROR: " .. module, vim.log.levels.ERROR)
  end
end

-- TODO: lsp-status
require "user.lsp.nlsp-settings"
require "user.lsp.mason"
require "user.lsp.null-ls"
require "user.lsp.diagnostics"
require "user.lsp.ui"
