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

return m
