if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.cmd "hi Normal guibg=#1e1e1e"
  vim.keymap.set("n", "`", "<c-w>")

  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
end

-- -- Create an autocommand group for buffer management
-- vim.api.nvim_create_augroup("BufferManagement", { clear = true })
--
-- -- Define the autocommand
-- vim.api.nvim_create_autocmd('BufDelete', {
--   group = 'BufferManagement',
--   callback = function()
--     vim.notify("Buffer deleted. bufadded = " .. tostring(vim.g._bufadded) .. " bufs=" .. #vim.fn.getbufinfo({ buflisted = 1 }))
--     if not vim.g._bufadded then
--       return
--     end
--     -- Check if there are any remaining listed buffers
--     local buffers = vim.fn.getbufinfo({ buflisted = 1 })
--     if #buffers == 0 then
--       -- No listed buffers, execute the desired command (e.g., open file tree)
--       vim.cmd('Neotree')
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufAdd", {
--   group = "BufferManagement",
--   callback = function()
--     vim.g._bufadded = true
--     vim.notify("Buffer added")
--   end,
-- })
