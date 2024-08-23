---@type LazySpec
return {
  {
    "jeniasaigak/goplay.nvim",
    init = function()
      LazyVim.on_load("which-key.nvim", function()
        require("which-key").add {
          { "<leader>CCg", desc = "Go Playground", mode = { "n" } },
        }
      end)
    end,
    config = function()
      require("goplay").setup {
        template = require("goplay.templates").default, -- template which will be used as the default content for the playground
        mode = "vsplit", -- current/split/[vsplit] specifies where the playground will be opened
        playgroundDirName = "goplayground", -- a name of the directory under GOPATH/src where the playground will be saved
        tempPlaygroundDirName = "goplayground_temp", -- a name of the directory under GOPATH/src where the temporary playground will be saved. This option is used when you need to execute a file
        output_mode = "formatted", -- [formatted]/raw mode to display output
      }
    end,
    keys = {
      { "<leader>CCgt", "<cmd>GPToggle<cr>", desc = "Go Playground Toggle", noremap = true, silent = true },
      { "<leader>CCge", "<cmd>GPExec<cr>", desc = "Go Playground Execute", noremap = true, silent = true },
      { "<leader>CCgf", "<cmd>GPExecFile<cr>", desc = "Go Playground Execute File", noremap = true, silent = true },
    },
  },
}
