local fn = vim.fn

local ok, _ = pcall(require, "project_nvim")
if not ok then
  vim.schedule(function()
    vim.notify("Reopen project.nvim is not installed", vim.log.levels.WARN, {
      title = "reopen-on-project",
    })
  end)
  return
end

local active = true

if active then
  -- Defer the call
  vim.schedule(function()
    -- Arguments count
    local argc = fn.argc()

    -- Vim flag count (-f, -c, etc)
    local flagc = #fn.split(fn.system("ps -o command= -p " .. fn.getpid())) - 1

    -- TODO: Probably change this, since it's an internal function of project_nvim
    local project_ok, project_root = pcall(require("project_nvim.project").get_project_root, "")

    if argc > 0 or flagc > 0 then
      return
    end

    -- Open explorer not in project_root
    if not project_ok or not project_root then
      vim.cmd [[Neotree]]
      return
    end

    -- Get recent files
    local oldfiles = vim.v.oldfiles
    local target = nil

    -- Loop over oldfile
    for _, filepath in pairs(oldfiles) do
      if vim.startswith(filepath, project_root) then
        target = filepath
        break
      end
    end

    -- Cancel if target file doesn't exists
    -- if not target or not vim.loop.fs_stat(target) then
    if not target or not vim.fn.findfile(target) then
      vim.cmd [[Neotree]]
      return
    end

    if target then
      vim.cmd("e! " .. target)

      vim.notify("Reopen " .. fn.fnamemodify(target, ":p:."), vim.log.levels.INFO, {
        title = "reopen-on-project",
      })
    end
  end)
end
