RELOAD "user.telescope"

local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup {
  defaults = {
    -- path_display = "tail",
    mappings = {
      n = {
        ["<leader><leader>"] = function()
          vim.cmd "Telescope cder theme=ivy"
        end,
      },
    },
  },
  pickers = {
    find_files = {
      -- path_display = "tail",
      -- find_command = { "fd", "--hidden", "--type", "f", "--exclude", ".git"},
      theme = "ivy",
      find_command = { "fd", "--hidden", "--type", "f", "--exclude", ".git" },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    cder = {
      dir_command = { "fd", "--hidden", "--type", "d", "--exclude", "go", ".", os.getenv "HOME" },
      previewer_command = "exa "
        .. "-a "
        .. "--color=always "
        .. "-T "
        .. "--level=3 "
        .. "--icons "
        .. "--git-ignore "
        .. "--long "
        .. "--no-permissions "
        .. "--no-user "
        .. "--no-filesize "
        .. "--git "
        .. "--ignore-glob=.git",
    },
  },
}

telescope.load_extension "fzy_native"
telescope.load_extension "cder"
