local M = {}

local TMUX_DIR_MAP = {
  ["h"] = "-L",
  ["j"] = "-D",
  ["k"] = "-U",
  ["l"] = "-R",
}

local ZELLIJ_DIR_MAP = {
  ["h"] = "left",
  ["j"] = "down",
  ["k"] = "up",
  ["l"] = "right",
}

local check_tmux = function()
  return vim.env["TMUX"] and true or false
end

local check_zellij = function()
  return vim.env["ZELLIJ"] ~= nil and vim.env["ZELLIJ"] ~= ""
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
    local is_zellij = check_zellij()
    local ok, is_on_edge = pcall(check_edge, direction)

    if not ok then
      vim.notify(string.format("Direction %s is not a valid direction", direction), vim.log.levels.WARN)
      return function() end
    end

    if is_on_edge and is_zellij then
      vim.fn.system("zellij action move-focus " .. ZELLIJ_DIR_MAP[direction])
    elseif is_on_edge and is_tmux then
      vim.fn.system("tmux select-pane " .. TMUX_DIR_MAP[direction])
    else
      vim.cmd("wincmd " .. direction)
    end
  end
end

return M
