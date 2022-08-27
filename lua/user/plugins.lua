return {
  ----------------------------------
  -- LSP
  ----------------------------------
  -- Configuration for LSPs
  "neovim/nvim-lspconfig",

  -- LSP package manager
  "williamboman/mason.nvim",

  -- Mason x lspconfig, automates hook setup, etc
  "williamboman/mason-lspconfig.nvim",

  -- Add "ensured_installed"-like feature for mason
  -- NOTE: probably remove this when merged to mason
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  -- Attach non-lsp (linter, formatter) as lsp
  "jose-elias-alvarez/null-ls.nvim",

  -- Lsp settings with json
  "tamago324/nlsp-settings.nvim",

  -- Provide json schema autocomplete (like vscode)
  "b0o/schemastore.nvim",

  ----------------------------------
  -- Completion and snippets
  ----------------------------------
  -- Completion engine
  "hrsh7th/nvim-cmp",

  -- Completion sources
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",

  "L3MON4D3/LuaSnip",
  -- "rafamadriz/friendly-snippets",

  ----------------------------------
  -- Treesitter
  ----------------------------------
  -- Treesitter engine
  "nvim-treesitter/nvim-treesitter",

  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "RRethy/nvim-treesitter-textsubjects",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "windwp/nvim-ts-autotag",
  -- Swap nodes using treesitter
  "mizlan/iswap.nvim",

  ----------------------------------
  -- Telescope
  ----------------------------------
  -- Telescope by Telescopic Johnson
  -- TODO: config
  "nvim-telescope/telescope.nvim",

  -- Telescope fzy sorter
  "nvim-telescope/telescope-fzy-native.nvim",

  -- Telescope helper for changing directories
  "zane-/cder.nvim",

  ----------------------------------
  -- UI Features
  ----------------------------------
  -- Colorscheme
  { "catppuccin/nvim", as = "catppuccin" },

  -- Add web dev icon
  "kyazdani42/nvim-web-devicons",

  -- Pretty notification
  -- TODO: config
  "rcarriga/nvim-notify",

  -- Status line
  -- TODO: config
  "nvim-lualine/lualine.nvim",

  -- Show buffers at top (like tabs in vscode)
  -- TODO: config
  "akinsho/bufferline.nvim",

  -- Git signcolumn colored lines (like vscode)
  -- TODO: config
  "lewis6991/gitsigns.nvim",

  -- Improve neovim input ui
  -- TODO: config
  "stevearc/dressing.nvim",

  ----------------------------------
  -- Quality of Life
  ----------------------------------
  -- Comment engine
  "numToStr/Comment.nvim",

  -- Keymapping popup helper
  "folke/which-key.nvim",

  -- Time tracker
  "wakatime/vim-wakatime",

  -- Smooth scrolling
  -- TODO: config
  "karb94/neoscroll.nvim",

  -- Neo-tree explorer
  -- TODO: config
  {
    "nvim-neo-tree/neo-tree.nvim",
    requires = "MunifTanjim/nui.nvim",
  },

  -- Remember last place on file reopen
  -- (Use autocommand mkview/loadview instead)
  -- TODO: config
  "ethanholz/nvim-lastplace",

  -- Readline operation like shell
  -- TODO: config
  "linty-org/readline.nvim",

  -- Convert single <-> multiline code
  "AndrewRadev/splitjoin.vim",

  -- TODO: config
  -- Project management, automate root-change
  "ahmedkhalf/project.nvim",

  -- Alignment tools, good for configs
  "junegunn/vim-easy-align",

  -- Colorize color values
  -- TODO: config
  "norcalli/nvim-colorizer.lua",

  -- Swiss-army knife of neovim plugins
  -- TODO: config
  { "echasnovski/mini.nvim", branch = "stable" },

  -- Better jump movements with hints
  -- TODO: config
  "ggandor/leap.nvim",

  ----------------------------------
  -- tpope
  ----------------------------------
  "tpope/vim-surround",
  "tpope/vim-abolish",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",

  ----------------------------------
  -- Core
  ----------------------------------
  -- Lua helper function
  "nvim-lua/plenary.nvim",

  -- Improve startup time
  "lewis6991/impatient.nvim",

  -- Visualize startup time
  "dstein64/vim-startuptime",

  -- Neovim lua "lsp"
  "folke/lua-dev.nvim",

  -- Powerful autopair
  "windwp/nvim-autopairs",

  -- Neorg
  -- TODO: config
  {
    "nvim-neorg/neorg",
    requires = {
      "nvim-neorg/neorg-telescope",
      "max397574/neorg-contexts",
    },
  },

  -- Add more useful textobjects
  -- use mini instead
  -- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
  -- "wellle/targets.vim",
}
