-- change diagnostics signs in signcolumn and etc
local signs = {
  { name = "diagnosticsignerror", text = "" },
  { name = "diagnosticsignwarn", text = "" },
  { name = "diagnosticsignhint", text = "" },
  { name = "diagnosticsigninfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = ""
  })
end

-- configuration for vim.diagnostics
local config = {
  virtual_text = false, -- disable virtual text
  signs = {
    active = signs, -- show signs
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)
