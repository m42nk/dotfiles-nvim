local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup {
  defaults = {
    layout_strategy = "bottom_pane",

    borderchars = {
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
    },
    -- border = false,
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
      -- theme = "ivy",
      find_command = {
        "fd",
        "--hidden",
        "--type",
        "f",
        "--exclude",
        ".git",
        "--exclude",
        "_build",
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    -- cder = {
    --   dir_command = { "fd", "--hidden", "--type", "d", "--exclude", "go", ".", os.getenv "HOME" },
    --   previewer_command = "exa "
    --     .. "-a "
    --     .. "--color=always "
    --     .. "-T "
    --     .. "--level=3 "
    --     .. "--icons "
    --     .. "--git-ignore "
    --     .. "--long "
    --     .. "--no-permissions "
    --     .. "--no-user "
    --     .. "--no-filesize "
    --     .. "--git "
    --     .. "--ignore-glob=.git",
    -- },
  },
}

telescope.load_extension "fzy_native"
-- telescope.load_extension "cder"

require("user.utils.keymaps").map {
  ["<leader>f"] = { "<cmd>Telescope find_files<CR>", "Find files" },
  ["<leader>t"] = {
    name = "Telescope",
    ["!"] = { "<cmd>Telescope command_history<CR>", "Command history" },
    ["P"] = { "<cmd>Telescope projects<CR>", "Projects" },
    ["b"] = { "<cmd>Telescope buffers<CR>", "Buffers" },
    ["h"] = { "<cmd>Telescope help_tags<CR>", "Help pages" },
    ["j"] = { "<cmd>Telescope jumplist<CR>", "Jumplist" },
    ["l"] = { "<cmd>Telescope live_grep<CR>", "Search text" },
    ["m"] = { "<cmd>Telescope man_pages<CR>", "Man pages" },
    ["o"] = { "<cmd>Telescope oldfiles<CR>", "Command history" },
    ["r"] = { "<cmd>Telescope resume<CR>", "Resume" },
    ["t"] = { "<cmd>Telescope<CR>", "List actions" },
    -- nmap("<leader>tp", require("user.utils").telescope_find_configs, "Find configs")
    -- nmap("<leader>tn", require("user.utils").telescope_find_notes, "Find notes")
  },
}
