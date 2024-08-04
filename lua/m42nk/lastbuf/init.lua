-- Table to store closed buffer history
local closed_buffers = {}

local M = {}

-- Function to save closed buffer history
local function save_closed_buffer()
  local buf = vim.api.nvim_get_current_buf()
  local buf_path = vim.api.nvim_buf_get_name(buf)

  -- Only save the buffer if it has a name (i.e., it is a file)
  if buf_path ~= "" then
    vim.notify("saved: " .. last_buf_path)
    table.insert(closed_buffers, buf_path)
  end
end

-- -- Autocommand to track buffer deletions
-- vim.api.nvim_create_autocmd("BufDelete", {
--   pattern = "*",
--   callback = save_closed_buffer,
--   group = vim.api.nvim_create_augroup("lastbuf", { clear = true }),
-- })

-- Function to reopen the last closed buffer
M.reopenLastClosedBuffer = function()
  if #closed_buffers == 0 then
    print "No recently closed buffers"
    return
  end

  local last_buf_path = table.remove(closed_buffers)
  vim.notify("reopen: " .. last_buf_path)
  vim.cmd("edit " .. last_buf_path)
end

return M
