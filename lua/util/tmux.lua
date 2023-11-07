local M = {}

local TMUX_DIR_MAP = {
  ["h"] = "-L",
  ["j"] = "-D",
  ["k"] = "-U",
  ["l"] = "-R",
}

local check_tmux = function()
  return vim.env["TMUX"] and true or false
end

local check_edge = function(direction)
  return vim.fn.winnr() == vim.fn.winnr(direction)
end

---@return function
-- @usage
-- vim.keymap.set("n", "<c-w>h", require("util.tmux").navigate "h")
M.navigate = function(direction)
  return function()
    local is_tmux = check_tmux()
    local ok, is_on_edge = pcall(check_edge, direction)

    if not ok then
      vim.notify(string.format("Direction %s is not a valid direction", direction), vim.log.levels.WARN)
      return function() end
    end

    if is_on_edge and is_tmux then
      vim.fn.system("tmux select-pane " .. TMUX_DIR_MAP[direction])
    else
      vim.cmd("wincmd " .. direction)
    end
  end
end

return M
