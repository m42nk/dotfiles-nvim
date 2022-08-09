local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local custom = augroup("CustomGroup", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = custom,
})

-- Hide [No Name] buffer on leave
-- autocmd("BufLeave", {
--   pattern = "",
--   callback = function()
--     local fname = vim.api.nvim_buf_get_name(0)
--     local ftype = vim.bo.filetype
--     if fname == "" and ftype == "" then
--       vim.cmd [[bwipeout]]
--     end
--   end,
--   group = custom,
-- })

-- Don't continue commenting when pressing `o/O`
-- autocmd("FileType", {
--   pattern = "*",
--   command = [[
--   set formatoptions-=o
--   setlocal formatoptions-=o
--   ]],
--   group = custom,
-- })

-- Preserve folding
autocmd({ "BufWinEnter", "BufWinLeave" }, {
  callback = function(opts)
    if opts.file == "" or opts.file == nil then
      return
    end

    if opts.event == "BufWinEnter" then
      vim.cmd [[mkview]]
    else
      vim.cmd [[silent! loadview]]
    end
  end,
  group = custom,
})

-- Start insert mode on opening gitcommit file
autocmd("FileType", {
  pattern = "gitcommit",
  command = [[startinsert]],
  group = custom,
})

-- Map q to close
autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "lspinfo" },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
  group = custom,
})

-- Map q to close
autocmd("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = custom,
})

-- Map q to close
autocmd("FileType", {
  pattern = { "fugitive", "git" },
  command = [[ nnoremap <buffer><silent> q :bwipeout<CR> ]],
  group = custom,
})
