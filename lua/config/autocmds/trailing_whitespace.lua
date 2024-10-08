local M = {}

M.callback = function(e)
    -- stylua: ignore
    local ignored_ft = {
      ["nofile"] = true,
      ["TelescopePrompt"] = true,
      ["Trouble"] = true,
      ["WhichKey"] = true,
      ["dashboard"] = true,
      ["help"] = true,
      ["lazy"] = true,
      ["lspinfo"] = true,
      ["mason"] = true,
      ["neo-tree"] = true,
      ["noice"] = true,
      ["notify"] = true,
      ["null-ls-info"] = true,
    }

  if vim.bo.readonly or vim.bo.filetype == "" then
    return
  end

  if vim.bo.buftype == "terminal" then
    return
  end

  if ignored_ft[vim.bo.filetype] then
    return
  end

  if e.event == "InsertEnter" then
    vim.cmd [[match none]]
    return
  end

  vim.cmd [[match TrailingWhitespace /\s\+$/]]
end

return M
