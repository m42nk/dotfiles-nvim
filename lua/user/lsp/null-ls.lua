local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local my_sources = {
  diagnostics.codespell,
  diagnostics.misspell,
  diagnostics.shellcheck,
  formatting.markdownlint,
  formatting.prettierd,
  formatting.stylua,
  code_actions.gitsigns,
  code_actions.eslint_d,
}

local sources = {}

for _, source in pairs(my_sources) do
  local command = source._opts.command
  -- If there's a command, check if that command available
  if command and vim.fn.executable(command) then
    table.insert(sources, source)
  -- If not, don't check commands
  else
    table.insert(sources, source)
  end
end

null_ls.setup {
  sources = sources,
  on_attach = require("user.lsp.on_attach")
}
