local ok, neorg = pcall(require, "neorg")
if not ok then
  return
end

-- TODO:
-- pick available element/symbol, like notion "/"
-- shortcut for bold, italic, etc
-- insert snippet for inserting symbol
-- -- `page` will generate new template: {name}[name] to create file easily

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["external.context"] = {},
    ["core.keybinds"] = {
      config = {
        hook = function(keybinds)
          keybinds.map_event_to_mode("norg", {
            n = {
              { "<C-s>", "core.integrations.telescope.find_linkable" },
            },

            i = {
              { "<C-i>", "core.integrations.telescope.insert_link" },
            },
          })
        end,
      },
    },
    ["core.norg.concealer"] = {},
    ["core.norg.qol.toc"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.integrations.telescope"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          brain = "~/Notes/brain",
          elixir = "~/Notes/elixir",
        },
      },
    },
  },
}

require "user.neorg.keymaps"
