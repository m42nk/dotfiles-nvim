return {
  {
    "folke/noice.nvim",
    ---@type NoiceConfig
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          position = {
            row = "0%",
            col = "50%",
          },
          size = {
            width = "auto",
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
        cmdline_popupmenu = {
          position = {
            row = 4,
            col = "50%",
          },
        },
        popupmenu = {
          border = {
            style = "rounded",
          },
        },
      },
      popupmenu = {
        backend = "cmp",
      },
    },
  },
}
