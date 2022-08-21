local with = vim.lsp.with
local handlers = vim.lsp.handlers

handlers["textdocument/hover"] = with(
handlers.hover, {
  border = "single"
})

handlers["textdocument/signaturehelp"] = with(
handlers.signature_help, {
  border = "single",
})
