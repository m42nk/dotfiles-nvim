local on_attach = function(client, bufnr)
  -- -- Load custom config if exists in lua/lsp/settings/*
  -- local settings_ok, settings =
  --   pcall(require, "user.lsp.settings." .. client.name)

  -- -- Disable formatting via lsp (provided by other, ideally in null-ls)
  -- if settings_ok and settings._disable_formatting then
  --   client.server_capabilities.documentFormattingProvider = false
  --   client.server_capabilities.documentRangeFormattingProvider = false
  -- end

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  -- Attach keymaps
  require("user.lsp.keymaps").attach(bufnr)

  -- TODO: lsp-status
  -- Lsp status
  -- local lsp_status_ok, lsp_status = pcall(require, "lsp-status")
  -- if lsp_status_ok then
  --   lsp_status.on_attach(client)
  -- end
end

return on_attach
