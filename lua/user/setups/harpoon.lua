require("harpoon").setup {}

require("telescope").load_extension "harpoon"

require("user.utils.keymaps").nmap {
  ["<M-1>"] = {"<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon go to file 1"},
  ["<M-2>"] = {"<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon go to file 2"},
  ["<M-3>"] = {"<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon go to file 3"},
  ["<M-4>"] = {"<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon go to file 4"},
  ["<M-5>"] = {"<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon go to file 5"},
  ["<leader>h"] = {
    name = "harpoon",
    ["h"] = {
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      "Harpoon quickfix menu",
    },
    ["a"] = {
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      "Harpoon add file",
    },
  },
}
