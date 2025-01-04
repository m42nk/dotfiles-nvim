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
    -- if state.current_position == "float" then
    --   state.commands.close_window(state)
    --   require("neo-tree.command").execute({
    --     action = "focus",
    --     source = state.name,
    --     position = "bottom",
    --   })
    --
    --   vim.notify(
    --     "NeoTree: Position changed, press `P` again to toggle preview",
    --     vim.log.levels.INFO,
    --     { title = "NeoTree" }
    --   )
    --
    --   return
    -- end

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

return M
