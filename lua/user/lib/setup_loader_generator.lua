return function(basedir)
  return function(modname)
    local ok, err = pcall(require, basedir .. "." .. modname)
    if not ok then
      vim.schedule(function()
        vim.notify("SETUP: Failed to load: " .. modname, vim.log.levels.WARN)
        vim.notify(err, vim.log.levels.WARN)
      end)
      return
    end
  end
end
