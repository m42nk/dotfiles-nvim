local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local config = {
  source_names = {
    nvim_lsp = "[LSP]",
    neorg = "[Neorg]",
    emoji = "[Emoji]",
    path = "[Path]",
    luasnip = "[Snip]",
    buffer = "[Buffer]",
  },
}

return {
  fields = { "abbr", "kind", "menu" },
  format = function(entry, vim_item)
    vim_item.kind = kind_icons[vim_item.kind] .. " " .. vim_item.kind
    vim_item.menu = config.source_names[entry.source.name]
    return vim_item
  end,
  duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 1,
    luasnip = 1,
  },
}
