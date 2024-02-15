return {
  {
    "folke/flash.nvim",
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
