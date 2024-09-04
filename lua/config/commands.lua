-- NOTE: add custom commands here

vim.api.nvim_create_user_command("CdGitRoot", function()
  -- local dot_git_path = vim.fn.finddir(".git", ".;")
  -- local git_root
  -- vim.fn.fnamemodify(dot_git_path, ":h")

  local git_root = LazyVim.root.git()
  if git_root ~= nil or git_root ~= "" then
    vim.api.nvim_set_current_dir(git_root)
    vim.notify("Changed directory to: " .. git_root, vim.log.levels.INFO)
    return
  end

  vim.notify("Git root not found", vim.log.levels.WARN)
end, {})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  local conformArgs = { async = true, lsp_fallback = true, force = true }
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }

    conformArgs.range = range
  end
  require("conform").format(conformArgs)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, true, true), "n", true)
end, { range = true })

vim.api.nvim_create_user_command("CloseWindowlessBuffers", function()
  local bufinfos = vim.fn.getbufinfo { buflisted = true }
  vim.tbl_map(function(bufinfo)
    local is_windowless = not bufinfo.windows or #bufinfo.windows == 0
    if bufinfo.changed == 0 and is_windowless then
      print(("Deleting buffer %d : %s"):format(bufinfo.bufnr, bufinfo.name))
      vim.api.nvim_buf_delete(bufinfo.bufnr, { force = false, unload = false })
    end
  end, bufinfos)
end, { desc = "Close hidden buffer (not visible in window)" })

vim.api.nvim_create_user_command("Lazygit", function()
  -- local lv = require("lazyvim")
  LazyVim.lazygit { cwd = LazyVim.root.git() }
end, { desc = "Open lazygit" })

vim.api.nvim_create_user_command("E", function()
  ok, neotree_command = pcall(require, "neo-tree.command")
  if not ok then
    vim.notify("Neotree not installed", vim.log.levels.WARN)
    return
  end

  require("neo-tree.command").execute {
    action = "focus",
    toggle = true,
    position = "current",
    reveal = true,
    dir = LazyVim.root.git(),
  }
end, { desc = "Toggle Neotree" })
