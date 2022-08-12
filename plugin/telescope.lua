local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup {
  defaults = {
    -- path_display = "tail",
  },
  pickers = {
    find_files = {
      -- path_display = "tail",
      find_command = { "fd", "--hidden", "--type", "f" },
    },
  },
  extensions = {
    -- fzy_native = {
    --   override_generic_sorter = false,
    --   override_file_sorter = true,
    -- },
  },
}

telescope.load_extension "fzy_native"
