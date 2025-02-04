return {
  "akinsho/git-conflict.nvim",
  version = "*",
  lazy = false,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "GitConflictDetected",
      callback = function()
        vim.notify("Conflict detected in " .. vim.fn.expand "<afile>")
      end,
    })
  end,
  opts = {
    default_mappings = false,
    -- default_commands = true, -- disable commands created by this plugin
    -- disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
    -- list_opener = "copen", -- command or function to open the conflicts list
    -- highlights = { -- They must have background color, otherwise the default color will be used
    --   incoming = "DiffAdd",
    --   current = "DiffText",
    -- },
  },
  cmd = {
    "GitConflictChooseOurs",
    "GitConflictChooseTheirs",
    "GitConflictChooseBoth",
    "GitConflictChooseNone",
    "GitConflictNextConflict",
    "GitConflictPrevConflict",
    "GitConflictListQf",
  },
  keys = {
    { "gC", "", desc = "Git Conflict", mode = "n" },
    { "gCo", "<Plug>(git-conflict-ours)", desc = "Git Conflict: choose ours", mode = "n" },
    { "gCt", "<Plug>(git-conflict-theirs)", desc = "Git Conflict: choose theirs", mode = "n" },
    { "gCb", "<Plug>(git-conflict-both)", desc = "Git Conflict: choose both", mode = "n" },
    { "gC0", "<Plug>(git-conflict-none)", desc = "Git Conflict: choose none", mode = "n" },
    { "[x", "<Plug>(git-conflict-prev-conflict)", desc = "Git Conflict: move to previous conflict", mode = "n" },
    { "]x", "<Plug>(git-conflict-next-conflict)", desc = "Git Conflict: move to next conflict", mode = "n" },
  },
}
