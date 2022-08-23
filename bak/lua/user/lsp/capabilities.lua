local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_cmp_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

-- Lsp status
local lsp_status_ok, lsp_status = pcall(require, "lsp-status")
if lsp_status_ok then
  capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities) or capabilities
end

return capabilities
