local M = {}

-- Behavior
-- Only expand when user select an entry
-- otherwise just send regular enter
M.key_enter = function(fallback)
  local has_cmp, cmp = pcall(require, "cmp")
  if not has_cmp then
    fallback()
    return
  end

  if cmp.visible() and cmp.get_active_entry() then
    cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert })
  else
    fallback()
  end
end

M.key_tab = function(fallback)
  local has_cmp, cmp = pcall(require, "cmp")
  if not has_cmp then
    fallback()
    return
  end

  if cmp.visible() then
    -- HACK: this is a gopls workaround for when current text
    --  match exactly as one of the completion item, pressing tab
    --  will replace the text with the completion item + snippet gibberish
    -- vim.api.nvim_input("<Down>")
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
  else
    fallback()
  end
end

M.key_shift_tab = function(fallback)
  local has_cmp, cmp = pcall(require, "cmp")
  if not has_cmp then
    fallback()
    return
  end

  if cmp.visible() then
    -- vim.api.nvim_input("<Up>")
    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
  else
    fallback()
  end
end

M.key_ctrl_l = function(fallback)
  local has_luasnip, luasnip = pcall(require, "luasnip")
  if not has_luasnip then
    fallback()
    return
  end

  if luasnip.expand_or_locally_jumpable() then
    luasnip.expand_or_jump()
  end
end

M.key_ctrl_h = function(fallback)
  local has_luasnip, luasnip = pcall(require, "luasnip")
  if not has_luasnip then
    fallback()
    return
  end

  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

M.formatting_format = function(entry, item)
  --stylua: ignore
  local icons = {
    Array = " ", Boolean = "󰨙 ", Class = " ", Codeium = "󰘦 ",
    Color = " ", Control = " ", Collapsed = " ", Constant = "󰏿 ",
    Constructor = " ", Copilot = " ", Enum = " ", EnumMember = " ",
    Event = " ", Field = " ", File = " ", Folder = " ",
    Function = "󰊕 ", Interface = " ", Key = " ", Keyword = " ",
    Method = "󰊕 ", Module = " ", Namespace = "󰦮 ", Null = " ",
    Number = "󰎠 ", Object = " ", Operator = " ", Package = " ",
    Property = " ", Reference = " ", Snippet = "󱄽 ", String = " ",
    Struct = "󰆼 ", Supermaven = " ", TabNine = "󰏚 ", Text = " ",
    TypeParameter = " ", Unit = " ", Value = " ", Variable = "󰀫 ",
  }

  if icons[item.kind] then
    item.kind = icons[item.kind] .. item.kind
  end

  local widths = {
    abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
    menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
  }

  for key, width in pairs(widths) do
    if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
      item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
    end
  end

  return item
end

return M
