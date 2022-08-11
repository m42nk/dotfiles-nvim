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
      vim.fn.resolve(vim.env.MYVIMRC:match "(.*[/\\])"),
    },
  }
end

M.i_hate_packersync = function()
  require("packer").clean()
  require("packer").install()
end

M.tmux_aware_nav = require("user.utils.tmux-aware-nav")

return M
