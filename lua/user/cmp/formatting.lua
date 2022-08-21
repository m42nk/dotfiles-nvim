local kind_icons = require "user.cmp.kind_icons"

local config = {
  source_names = {
    nvim_lsp = "[LSP]",
    neorg = "[Neorg]",
    emoji = "[Emoji]",
    path = "[Path]",
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
  },
  duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    luasnip = 1,
  },
}

return {
  fields = { "abbr", "kind", "menu" },
  format = function(entry, vim_item)
    -- TODO: move to global
    -- local f = assert(io.open("quicksave.txt", "a"))
    -- f:write(vim.inspect(entry.source:get_debug_name()), "\n")
    -- f:close()

    vim_item.kind = kind_icons[vim_item.kind] .. " " .. vim_item.kind
    vim_item.menu = config.source_names[entry.source.name]
    vim_item.dup = config.duplicates[entry.source.name]

    return vim_item
  end,
}
