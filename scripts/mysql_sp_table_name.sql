local bufnr = 0
local lang = "sql"

local query = vim.treesitter.query.parse(lang, [[
  (relation
    (object_reference
      name: (identifier) @table.name))
]])

local parser = vim.treesitter.get_parser(bufnr, lang)
local tree = parser:parse()[1]
local root = tree:root()

local tables = {}

for id, node in query:iter_captures(root, bufnr) do
  if query.captures[id] == "table.name" then
    local name = vim.treesitter.get_node_text(node, bufnr)
    tables[name] = true
  end
end

for name in pairs(tables) do
  print(name)
end
