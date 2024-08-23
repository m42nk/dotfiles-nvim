local M = {}
local trouble = require "trouble"
local lsp_util = vim.lsp.util

-- Define a function to filter LSP references by filename
M.filtered_references = function(filter_filename)
  local params = lsp_util.make_position_params()

  -- Call the LSP function to get references
  vim.lsp.buf_request(0, "textDocument/references", params, function(err, result, ctx, config)
    if err then
      vim.notify("LSP Error: " .. err.message, vim.log.levels.ERROR)
      return
    end

    if not result or vim.tbl_isempty(result) then
      vim.notify("No references found", vim.log.levels.INFO)
      return
    end

    -- Filter the references by filename
    local filtered_result = vim.tbl_filter(function(reference)
      return reference.uri:match(filter_filename)
    end, result)

    -- If there are no results after filtering, notify the user
    if vim.tbl_isempty(filtered_result) then
      vim.notify("No references found in the specified file", vim.log.levels.INFO)
      return
    end

    vim.print(filtered_result)

    -- Use Trouble.nvim to show the filtered results
    -- trouble.open { mode = "lsp_references", auto_open = false, result = filtered_result }
    require("trouble").open { mode = "qflist", bufnr = 0, items = filtered_result }
  end)
end

return M
