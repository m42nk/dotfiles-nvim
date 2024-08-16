local icons = require("lazyvim.config").icons

local M = {}

local cond = {
  is_win_wide = function()
    return vim.fn.winwidth(0) > 90
  end,
}

-- Current vim mode, will display empty string with background color
M.mode = {
  -- stylua: ignore
  function() return "" end,
  padding = { left = 0, right = 0 },
}

M.diagnostics = {
  "diagnostics",
  symbols = {
    error = icons.diagnostics.Error,
    warn = icons.diagnostics.Warn,
    info = icons.diagnostics.Info,
    hint = icons.diagnostics.Hint,
  },
}

M.filetype = {
  "filetype",
  icon_only = true,
  separator = "",
  padding = { left = 1, right = 0 },
}

M.plugin_updates = {
  require("lazy.status").updates,
  cond = require("lazy.status").has_updates,
  color = LazyVim.ui.fg "Special",
}

M.diff = {
  "diff",
  symbols = {
    added = icons.git.added,
    modified = icons.git.modified,
    removed = icons.git.removed,
  },
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
}
-- stylua: ignore
M.statusline_command = {
  function() return require("noice").api.status.command.get() end,
  cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
  color = LazyVim.ui.fg("Statement"),
}

-- stylua: ignore
M.statusline_mode = {
  function() return require("noice").api.status.mode.get() end,
  cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
  color = function()
    local mode = require("noice").api.status.mode.get()

    if mode ~= nil then
      local match = string.match(mode, "^recording")
      if match ~= nil and #match > 0 then
        -- return {bg="red", fg=vim.api.nvim_get_hl(0, {name="Constant"})}
        return { bg="red", fg="white"}
      end
    end

    return LazyVim.ui.fg("Constant")
  end,
}

-- stylua: ignore
M.dap = {
  function() return "  " .. require("dap").status() end,
  cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
  color = LazyVim.ui.fg("Debug"),
}

M.treesitter_status = {
  function()
    return ""
  end,
  cond = function()
    local buf = vim.api.nvim_get_current_buf()
    local ts = vim.treesitter.highlighter.active[buf]

    return not ts or vim.tbl_isempty(ts)
  end,
  color = LazyVim.ui.fg "Error",
}

M.python_env = {
  function()
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV"
      if venv then
        return string.format("  (%s)", venv)
      end

      venv = os.getenv "VIRTUAL_ENV"
      if venv then
        return string.format("  (%s)", venv)
      end

      return ""
    end
    return ""
  end,
  color = LazyVim.ui.fg "Constant",
}

M.location = {
  "location",
  padding = { left = 1, right = 1 },
}

M.copilot = {
  function()
    local is_enabled = not require("copilot.client").is_disabled()

    return is_enabled and "" or ""
  end,
  color = function()
    local is_enabled = not require("copilot.client").is_disabled()
    local is_started = require("copilot.client").get()
    local is_suggestion_enabled = vim.b.copilot_suggestion_auto_trigger

    if not is_enabled then
      return LazyVim.ui.fg "Error"
    end

    if not is_started then
      return LazyVim.ui.fg "Comment"
    end

    if not is_suggestion_enabled then
      return LazyVim.ui.fg "WarningMsg"
    end

    return LazyVim.ui.fg "Normal"
  end,
}

return M
