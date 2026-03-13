---@type LazySpec
return {
  {
    "karb94/neoscroll.nvim",
    enabled = false, -- DEPRECATED: use Snacks.scroll
    config = function()
      require("neoscroll").setup {
        easing = "cubic",
      }
    end,
    init = function()
      LazyVim.on_load("which-key.nvim", function()
        -- local t = {}
        -- --         -- Syntax: t[keys] = {function, {function arguments}}
        -- --         -- Use the "sine" easing function
        -- --         -- t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "350", [['sine']] } }
        -- --         -- t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "350", [['sine']] } }
        -- --
        -- --         t["<C-u>"] = { "scroll", { -15, "true", "100", [['quadratic']] } }
        -- --         t["<C-d>"] = { "scroll", { 15, "true", "100", [['quadratic']] } }
        -- --         -- Use the "circular" easing function
        -- --         t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "100", [['quadratic']] } }
        -- --         t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "100", [['quadratic']] } }
        -- --         -- Pass "nil" to disable the easing animation (constant scrolling speed)
        -- --         t["<C-y>"] = { "scroll", { "-0.10", "false", "100", nil } }
        -- --         t["<C-e>"] = { "scroll", { "0.10", "false", "100", nil } }
        -- --         -- When no easing function is provided the default easing function (in this case "quadratic") will be used
        -- --         t["zt"] = { "zt", { "300" } }
        -- --         t["zz"] = { "zz", { "300" } }
        -- --         t["zb"] = { "zb", { "300" } }
        -- --
        -- --         require("neoscroll.config").set_mappings(t)

        -- local neoscroll = require "neoscroll"

        -- <C-u>    scroll(-vim.wo.scroll, true, 350)
        -- <C-d>    scroll( vim.wo.scroll, true, 350)
        -- <C-b>    scroll(-vim.api.nvim_win_get_height(0), true, 550)
        -- <C-f>    scroll( vim.api.nvim_win_get_height(0), true, 550)
        -- <C-y>    scroll(-0.10, false, 100)
        -- <C-e>    scroll( 0.10, false, 100)
        --  zt      zt(200)
        --  zz      zz(200)
        --  zb      zb(200)
      end)
    end,
  },
}
