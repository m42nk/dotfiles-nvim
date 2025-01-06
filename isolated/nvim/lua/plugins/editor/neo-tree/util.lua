local M = {}

M.shift_h = {
  function(state)
    if state.name == "filesystem" then
      return state.commands.navigate_up(state)
    end

    return state.commands.close_node(state)
  end,
  desc = "Close node [Other], Go to Parent [FS]",
}

M.ctrl_h = {
  function(state)
    if state.name == "filesystem" then
      return state.commands.toggle_hidden(state)
    end
  end,
  desc = "Toggle Hidden Files [FS]",
}

M.shfit_e = {
  function(state)
    if state.current_position == "current" then
      return
    end

    state.commands.close_window(state)
    require("neo-tree.command").execute({
      action = "focus",
      position = "current",
      source = state.name,
      reveal = true,
    })
  end,
  desc = "Change position to current",
}

M.shfit_p = {
  function(state)
    state.commands.toggle_preview(state)
  end,
  config = { use_float = false },
  desc = "Toggle Preview",
}

M.shift_y = {
  function(state)
    local node = state.tree:get_node()
    local path = node:get_id()
    vim.notify("Path copied to clipboard:\n" .. path, vim.log.levels.INFO, { title = "NeoTree" })
    vim.fn.setreg("+", path, "c")
  end,
  desc = "Copy Path to Clipboard",
}

M.init_fn = function()
  -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
  -- because `cwd` is not set up properly.
  vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
    desc = "Start Neo-tree with directory",
    once = true,
    callback = function()
      if package.loaded["neo-tree"] then
        return
      end

      ---@diagnostic disable-next-line: param-type-mismatch
      local stats = vim.loop.fs_stat(vim.fn.argv(0))

      if stats and stats.type == "directory" then
        require("neo-tree")
      end
    end,
  })
end

return M
