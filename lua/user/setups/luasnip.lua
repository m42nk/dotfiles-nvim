local ok, _ = pcall(require, "luasnip")

if not ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip/loaders/from_lua").lazy_load()
