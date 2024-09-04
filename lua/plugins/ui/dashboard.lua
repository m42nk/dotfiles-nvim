return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config.center = vim.tbl_extend("keep", {
        -- stylua: ignore
        { action = "Neotree position=current", desc = " Explore", icon = "󰉋 ", key = "e", },
      }, opts.config.center)

      return opts
    end,
  },
}
