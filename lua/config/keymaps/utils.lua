local m = {}

----------
-- Pane
----------
m.paneToggleSize = function()
  if vim.g._pane_maximized == true then
    vim.g._pane_maximized = false
    vim.cmd "wincmd ="
  else
    vim.g._pane_maximized = true
    vim.cmd "wincmd |"
  end
end

----------
-- Buffers
----------
m.bufferAlternate = function()
  vim.cmd.b "#"
end

m.bufferFormat = function()
  require("conform").format { async = true, lsp_fallback = true, force = true }
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, true, true), "n", true)
end

m.bufferFoldTopLevelClose = function()
  vim.cmd "%foldclose"
end

m.bufferFoldTopLevelOpen = function()
  vim.cmd "%foldopen"
end

m.bufferlineToggle = function()
  vim.opt.showtabline = vim.opt.showtabline:get() ~= 0 and 0 or 2
end

m.splitsCloseAndBufferUnload = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local windows = vim.fn.getbufinfo(bufnr)[1].windows

  if #windows == 1 then
    vim.cmd "bd"
  else
    vim.cmd "close"
  end
end

m.bufferGetFiletype = function()
  local filetype = vim.bo.filetype
  vim.notify("Filetype of the current buffer is \n" .. filetype)
end

m.bufferSetFiletype = function()
  local filetype = vim.fn.input("Set filetype to: ", vim.bo.filetype, "filetype")
  vim.bo.filetype = filetype
end

----------
-- Project
----------
m.projectChangeToGitRoot = function()
  vim.cmd "CdGitRoot"
end

m.projectCompareWithMaster = function()
  require("gitsigns").change_base("master", true)
  vim.cmd "Neotree git_status git_base=master position=right"
end

-- m.projectCompareWithBranch = function()
--   require("gitsigns").change_base("master", true)
--   vim.cmd "Neotree git_status git_base=master position=right"
-- end

m.projectGrepWithContext = function()
  local lineContext = 1
  -- TODO: make language-agnostic
  local defaultCommand = string.format("grep -g '!*_test.go' -g '!mock' --context=%d ''", lineContext)
  local command = vim.fn.input("Search: ", defaultCommand)
  vim.cmd(command)
end

----------
-- Misc
----------
m.superEscapeExpr = function()
  local ok, snacks = pcall(require, "snacks")
  if ok then
    snacks.notifier.hide()
  end

  vim.cmd.nohlsearch()
  return "<esc>"
end

-- m.listReferencesByAccess = function(access_type)
--   local Kinds = {
--     ["Text"] = 1,
--     ["Read"] = 2,
--     ["Write"] = 3,
--   }
--   ---@diagnostic disable-next-line: missing-parameter
--   local params = vim.lsp.util.make_position_params(0, "utf-8")
--   -- vim.notify("Params: " .. vim.inspect(params))
--
--   -- Send a request to retrieve document highlights
--   vim.lsp.buf_request(0, "textDocument/references", params, function(err, result, ctx)
--     if err then
--       vim.notify("Error: " .. err.message, vim.log.levels.ERROR)
--       return
--     end
--
--     if not result or vim.tbl_isempty(result) then
--       vim.notify("No references found", vim.log.levels.INFO)
--       return
--     end
--
--     local client = vim.lsp.get_client_by_id(ctx.client_id)
--     local entries = {}
--
--     vim.notify("References found: " .. #result, vim.log.levels.INFO)
--
--     for _, ref in ipairs(result) do
--       local hlParam = { textDocument = { uri = ref.uri }, position = ref.range.start }
--       -- vim.notify("Reference: " .. vim.inspect(ref), vim.log.levels.INFO)
--
--       -- Send a request to document highlights for each reference
--       vim.lsp.buf_request(
--         0,
--         "textDocument/documentHighlight",
--         hlParam,
--         function(highlight_err, highlight_result, highlight_ctx)
--           vim.notify("Highlight Result: " .. vim.inspect(highlight_result), vim.log.levels.INFO)
--           -- vim.notify("Highlight Context: " .. vim.inspect(highlight_ctx), vim.log.levels.INFO)
--
--           if highlight_err then
--             vim.notify("Highlight Error: " .. highlight_err.message, vim.log.levels.ERROR)
--             return
--           end
--
--           if not highlight_result or vim.tbl_isempty(highlight_result) then
--             vim.notify("No document highlights found", vim.log.levels.INFO)
--             return
--           end
--
--           -- Check highlight kind and match with access_type
--           for _, highlight in ipairs(highlight_result) do
--             if highlight.kind == Kinds[access_type] then
--               table.insert(entries, vim.lsp.util.locations_to_items({ ref }, client.offset_encoding)[1])
--             end
--           end
--
--           -- Set quickfix list with the filtered entries
--           vim.fn.setqflist(entries)
--           vim.notify("References with " .. access_type .. " access listed in quickfix")
--         end
--       )
--     end
--   end)
-- end

return m
