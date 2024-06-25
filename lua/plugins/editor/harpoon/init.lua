return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    init = function()
      LazyVim.on_load("which-key.nvim", function()
        require("which-key").register {
          mode = { "n" },
          ["<leader>h"] = { name = "harpoon" },
        }
      end)
    end,
    config = function()
      local harpoon = require "harpoon"

      ---@type HarpoonPartialConfig
      local opts = {
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
        settings = {
          save_on_toggle = true,
        },
        -- default = {
        --   create_list_item = function(config, item)
        --     vim.notify(vim.inspect(item))
        --   end,
        --   select = function(list_item, list, option) end,
        -- },
      }

      harpoon:setup(opts)
    end,
    keys = function()
      local keys = {
        {
          "<leader>ha",
          function()
            require("harpoon"):list():add()

            local fpath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:.")
            vim.notify("Added file to harpoon:\n" .. fpath)
          end,
          desc = "Harpoon File (add)",
        },
        {
          "<leader>hh",
          function()
            local harpoon = require "harpoon"
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
}
