local function list_references_by_access(access_type)
  ---@diagnostic disable-next-line: missing-parameter
  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request(0, "textDocument/references", params, function(err, result, ctx)
    if err then
      vim.notify("Error: " .. err.message, vim.log.levels.ERROR)
      return
    end

    if not result or vim.tbl_isempty(result) then
      vim.notify("No references found", vim.log.levels.INFO)
      return
    end

    local client = vim.lsp.get_client_by_id(ctx.client_id)
    local entries = {}

    for _, ref in ipairs(result) do
      local kind = ref.kind
      if ref.kind == access_type then
        table.insert(entries, vim.lsp.util.locations_to_items({ ref }, client.offset_encoding)[1])
      end
    end

    vim.fn.setqflist(entries)
    vim.notify("References with " .. access_type .. " access listed in quickfix")
  end)
end

-- Example usage:
vim.keymap.set("n", "<leader>rr", function()
  list_references_by_access "Read"
end, { desc = "List Read references" })
vim.keymap.set("n", "<leader>rw", function()
  list_references_by_access "Write"
end, { desc = "List Write references" })
