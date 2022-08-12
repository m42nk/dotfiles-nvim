local M = {}

M.telescope_find_nvim_config = function()
  -- :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍
  local config_path = vim.fn.resolve(vim.env.MYVIMRC:match "(.*[/\\])")

  if not config_path or config_path == "" then
    vim.notify("Error: nvim path not found", vim.log.levels.ERROR)
    return
  end

  local opts = {}

  require("telescope.builtin").find_files {
    find_command = {
      "fd",
      "--search-path",
      config_path,
    },
  }
end

M.telescope_find_notes = function()
  -- :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍
  require("telescope.builtin").find_files {
    find_command = {
      "fd",
      "--search-path",
      vim.fn.expand "~" .. "/Notes",
    },
  }
end

M.telescope_find_configs = function()
  local home = vim.fn.expand "~"
  local config = home .. "/.config"

  local dirs = {
    config .. "/tmux",
    config .. "/nvim",
    config .. "/kitty",
  }

  local find_command = { "fd" }
  for _, dir in pairs(dirs) do
    table.insert(find_command, "--search-path")
    table.insert(find_command, dir)
  end

  require("telescope.builtin").find_files {
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail
      local target = nil
      local short = path

      for _, dir in pairs(dirs) do
        if vim.startswith(short, dir) then
          short = short:gsub(dir, "")
          target = tail(dir)
          break
        end
      end

      return string.format("%s [%s]", short, target)
    end,
    find_command = find_command,
  }
end

M.i_hate_packersync = function()
  require("packer").clean()
  require("packer").install()
end

M.tmux_aware_nav = require "user.utils.tmux-aware-nav"

return M
