return {
  {
    "folke/noice.nvim",
    ---@type NoiceConfig
    opts = {
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
          border = { style = "rounded" },
        },
        hover = {
          border = { style = "rounded" },
        },
        popup = {
          border = { style = "rounded" },
        },
      },
      popupmenu = {
        backend = "nui",
      },
      presets = {
        -- TODO:NOICEvCMP
        lsp_doc_border = true,
        command_pallete = false,
      },
      lsp = {
        -- TODO:NOICEvCMP
        -- hover = {
        --   enabled = false,
        --   -- silent = false, -- set to true to not show a message if hover is not available
        --   -- view = nil, -- when nil, use defaults from documentation
        --   -- ---@type NoiceViewOptions
        --   -- opts = {}, -- merged with defaults from documentation
        -- },
        -- documentation = {
        --   enabled = false,
        -- },
        -- override = {
        --   ["cmp.entry.get_documentation"] = false,
        -- },
      },
    },
  },
}
