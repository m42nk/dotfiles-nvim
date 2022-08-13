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
autocmd({ "BufWinEnter", "BufWritePre" }, {
  callback = function(opts)
    if opts.file == "" then
      return
    end

    if opts.event == "BufWritePre" then
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

-- Toggle line number mode based on events_setup
-- Show relativenumber if buffer is focused
autocmd({ "BufEnter", "FocusGained" }, {
  callback = function(opts)
    -- Don't toggle relativenumber if number is hidden
    if vim.wo.number then
      vim.wo.relativenumber = true
    end
  end,
  group = custom,
})

autocmd({ "BufLeave", "FocusLost" }, {
  callback = function(opts)
    vim.wo.relativenumber = false
  end,
  group = custom,
})

-- Autoreload config files
-- Kitty
autocmd("BufWritePost", {
  -- pattern = vim.fn.expand("~") .. '/.config/kitty/*.conf',
  -- Handles when vim resolve the symlinks to other than home dir
  pattern = "*/.config/kitty/*.conf",
  callback = function()
    vim.fn.system "kill -SIGUSR1 $(pgrep kitty)"
  end,
  group = custom,
})

-- Tmux
-- see https://github.com/m42nk/dotfiles-tmux
autocmd("BufWritePost", {
  -- pattern = vim.fn.expand("~") .. '*/.config/tmux/*.conf',
  -- Handles when vim resolve the symlinks to other than home dir
  pattern = {"*/.config/tmux/*.conf", "*/tmux/*.conf"},
  callback = function()
    if not vim.env["TMUX"] then
      vim.schedule(function()
        vim.notify "Not inside tmux"
      end)
      return
    end

    local output = vim.fn.system [[
    tmux source "$_cfg_default" "$_cfg_main" 2>&1 && \
    tmux display 'Config reloaded!'
    ]]

    if output ~= "" then
      -- NOTE: unsure how to pipe shell output to tmux new-window
      -- vim.fn.system("tmux new-window", output)
      -- Use vim output instead
      vim.pretty_print(output)
    end
  end,
  group = custom,
})

-- TODOHERE: make telescope sorter frecency (at least make recently opened file at the top)
