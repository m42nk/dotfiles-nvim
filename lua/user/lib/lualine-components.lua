local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ecbe7b",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#ff8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if not gitsigns then
    return
  end

  return {
    added = gitsigns.added,
    modified = gitsigns.changed,
    removed = gitsigns.removed,
  }
end

local function bufcount()
  local bufnrs = vim.tbl_filter(function(b)
    if 1 ~= vim.fn.buflisted(b) then
      return false
    end

    -- only hide unloaded buffers if opts.show_all_buffers is false, keep them listed if true or nil
    -- if not vim.api.nvim_buf_is_loaded(b) then
    --   return false
    -- end

    return true
  end, vim.api.nvim_list_bufs())

  return bufnrs
end

local conditions = {
  hide_in_width = function()
    return vim.fn.winwidth(0) > 90
  end,
}

return {
  mode = {
    function()
      return " "
    end,
    padding = { left = 0, right = 0 },
    color = {},
    cond = nil,
  },
  branch = {
    "b:gitsigns_head",
    icon = "",
  },
  python_env = {
    function()
      local utils = require "lvim.core.lualine.utils"
      if vim.bo.filetype == "python" then
        local venv = os.getenv "CONDA_DEFAULT_ENV"
        if venv then
          return string.format("  (%s)", utils.env_cleanup(venv))
        end
        venv = os.getenv "VIRTUAL_ENV"
        if venv then
          return string.format("  (%s)", utils.env_cleanup(venv))
        end
        return ""
      end
      return ""
    end,
    color = { fg = colors.green },
  },
  diff = {
    "diff",
    source = diff_source,
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = "" },
    cond = conditions.hide_in_width,
  },
  treesitter = {
    function()
      return ""
    end,
    color = function()
      local buf = vim.api.nvim_get_current_buf()
      local ts = vim.treesitter.highlighter.active[buf]
      return {
        fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red,
      }
    end,
  },
  location = {
    "location",
    color = {},
  },
  filetype = { "filetype", cond = conditions.hide_in_width },
  fileformat = {
    "fileformat",
    icons_enabled = false,
  },
  buf_count = {
    function()
      return "[" .. "#" .. vim.tbl_count(bufcount()) .. "]"
    end,
    padding = 0
  },
  -- WINBAR
  relative_pathname = {
    "filename",
    path = 1,
    fmt = function(msg)
      if vim.bo.filetype == "help" then
        return vim.fn.fnamemodify(vim.fn.expand "%", ":t")
      end
      return msg
    end,
  },
  ft_icon = {
    "filetype",
    icon_only = true,
    padding = { left = 1, right = 0 },
    icon = { align = "right" },
  },
  ft_icon_nocolor = {
    "filetype",
    icon_only = true,
    padding = { left = 1, right = 0 },
    colored = false,
    icon = { align = "right" },
  },
}
