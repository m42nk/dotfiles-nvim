-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = require("util.augroup").augroup

vim.api.nvim_create_autocmd("FileType", {
  group = augroup "man_positioning",
  pattern = { "help", "man" },
  callback = function()
    if vim.api.nvim_win_get_width(0) > 110 then
      vim.cmd.wincmd "L"
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt.formatoptions:remove "o"
  end,
})

vim.api.nvim_create_autocmd({ "FileType", "InsertEnter", "InsertLeave" }, {
  group = augroup "trailing_whitespace",
  pattern = { "*" },
  callback = function(e)
    -- stylua: ignore
    local ignored_filetypes = {
      "TelescopePrompt", "Trouble", "WhichKey",
      "dashboard", "help", "lazy", "lspinfo",
      "mason", "neo-tree", "noice", "notify",
      "null-ls-info",
    }

    if vim.bo.readonly or vim.bo.filetype == "" then
      return
    end

    for _, ft in ipairs(ignored_filetypes) do
      if vim.bo.filetype == ft then
        return
      end
    end

    if e.event == "InsertEnter" then
      vim.cmd [[match none]]
      return
    end

    vim.cmd [[match TrailingWhitespace /\s\+$/]]
  end,
})

-- Hover on cursorhold
-- vim.api.nvim_create_autocmd("CursorHold", {
--   pattern = { "*" },
--   group = augroup "cursor_hold_hover",
--   callback = function()
--     if require("cmp").visible() then
--       return
--     end
--
--     -- vim.api.nvim_command "set eventignore=CursorHold"
--     -- vim.api.nvim_command 'autocmd CursorMoved ++once set eventignore=" " '
--     vim.lsp.buf.hover()
--   end,
-- })
