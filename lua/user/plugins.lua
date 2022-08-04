return {
  ----------------------------------
  -- Core
  ----------------------------------
  {
    -- Package manager
    "wbthomason/packer.nvim",
  },
  {
    -- Lua helper function
    "nvim-lua/plenary.nvim",
  },
  {
    -- Neovim lua "lsp"
    "folke/lua-dev.nvim",
  },

  ----------------------------------
  -- LSP
  ----------------------------------
  {
    -- LSP package manager
    "williamboman/mason.nvim",

    -- Mason x lspconfig, automates hook setup, etc
    "williamboman/mason-lspconfig.nvim",

    -- Configuration for LSPs
    "neovim/nvim-lspconfig",

    -- Attach non-lsp (linter, formatter)
    -- as lsp
    "jose-elias-alvarez/null-ls.nvim",

    -- Loading spinner for lsp
    "j-hui/fidget.nvim",

    -- Highlight symbols under cursor
    -- like vscode
    "RRethy/vim-illuminate",
  },

  ----------------------------------
  -- Completions
  ----------------------------------
  {
    -- Completion engine
    "hrsh7th/nvim-cmp",
  },
  {
    -- Completion sources
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
  },

  ----------------------------------
  -- Snippets
  ----------------------------------
  {
    -- Snippet engine
    "L3MON4D3/LuaSnip",
  },
  {
    "rafamadriz/friendly-snippets",
    enable = false,
  },

  ----------------------------------
  -- Treesitter
  ----------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
  },

  ----------------------------------
  -- Minor feature improvement
  ----------------------------------
  {
    -- Readline operation like shell
    "linty-org/readline.nvim",

    -- Remember last place on file reopen
    "ethanholz/nvim-lastplace",
  },

  ----------------------------------
  -- General
  ----------------------------------
  {
    -- Colorschemes
    "navarasu/onedark.nvim",
  },

  {
    -- Telescope by Telescopic Johnson
    "nvim-telescope/telescope.nvim",
  },
  {
    -- Project management, automate root-change
    "ahmedkhalf/project.nvim",
  },
  {
    -- Alignment tools, good for configs
    "junegunn/vim-easy-align",
  },
  {
    -- Comment engine
    "numToStr/Comment.nvim",
  },
  {
    -- Add web dev icon
    "kyazdani42/nvim-web-devicons",
  },
  {
    -- Show buffers at top (like tabs in vscode)
    "akinsho/bufferline.nvim",
  },
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {}
    end,
  },

  -- {
  -- 	"nvim-telescope/telescope-frecency.nvim",
  -- 	requires = { "kkharji/sqlite.lua" },
  -- },
}
