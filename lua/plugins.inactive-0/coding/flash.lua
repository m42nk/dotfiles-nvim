---@type LazySpec
return {
  {
    "folke/flash.nvim",
    version = "~v2.1.0",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          -- Don't hijack regular vim search
          enabled = false,
        },
      }
    }
  }
}
