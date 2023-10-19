local function toggle_copilot()
  local is_disabled = require("copilot.client").is_disabled()
  if is_disabled then
    vim.notify "Enabling Copilot"
    require("copilot.command").enable()
  else
    vim.notify "Disabling Copilot"
    require("copilot.command").disable()
  end
end

require("user.utils.keymaps").nmap {
  ["<leader>g"] = {
    ["c"] = {
      require("copilot.suggestion").toggle_auto_trigger,
      "Copilot: Toggle Suggestion",
    },
    ["s"] = {
      require("copilot.suggestion").toggle_auto_trigger,
      "Copilot: Toggle Suggestion",
    },
    ["C"] = {
      toggle_copilot,
      "Copilot: Togggle Client",
    },
    ["S"] = {
      require("copilot.command").status,
      "Copilot: Status",
    },
  },
}

local M = {}

M.opts = {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
}

return M
