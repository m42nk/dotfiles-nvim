local m = {}

m.paneToggleSize = function()
  if vim.g._pane_maximized == true then
    vim.g._pane_maximized = false
    vim.cmd "wincmd ="
  else
    vim.g._pane_maximized = true
    vim.cmd "wincmd |"
  end
end

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

m.projectChangeToGitRoot = function()
  vim.cmd "CdGitRoot"
end

m.projectCompareWithMaster = function()
  vim.cmd "Gitsigns change_base master"
  vim.cmd "Neotree git_status git_base=master position=right"
end

m.superEscapeExpr = function()
  -- TODO: add pcall to notify
  require("notify").dismiss { silent = true, pending = true }
  vim.cmd.nohlsearch()
  return "<esc>"
end

return m
