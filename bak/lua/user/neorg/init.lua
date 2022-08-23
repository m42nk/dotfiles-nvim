local ok, neorg = pcall(require, "neorg")
if ok then
  neorg.setup {
    load = {
      ["core.defaults"] = {},
      ["core.export"] = {},
      ["core.norg.concealer"] = {},
      ["core.integrations.telescope"] = {},
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      --[[ ["core.presenter"] = {}, ]]
      --[[ ["core.gtd.base"] = { ]]
      --[[   config = { ]]
      --[[     workspace = "todo", ]]
      --[[   }, ]]
      --[[ }, ]]
      ["core.norg.qol.toc"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            --[[ todo = "~/Notes/todo", ]]
            brain = "~/Notes/brain",
            gojek = "~/Notes/gojek",
          },
        },
      },
    },
  }
end

local m = require "user.utils.maps"

local group = vim.api.nvim_create_augroup("NeorgCustom", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "norg",
  callback = function()
    put "halogeming"
  end,
  group = group,
})

m.nmap("<leader>o", function()
  put "halo"
end, "Neorg")
