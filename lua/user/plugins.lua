return {
  ----------------------------------
  -- Core
  ----------------------------------
  { "catppuccin/nvim", as = "catppuccin" },

  -- Lua helper function
  "nvim-lua/plenary.nvim",

  -- Improve startup time
  "lewis6991/impatient.nvim",

  -- Visualize startup time
  "dstein64/vim-startuptime",

  -- Comment engine
  "numToStr/Comment.nvim",

  --   -- Neovim lua "lsp"
  --   "folke/lua-dev.nvim",
  --
  --   -- Add web dev icon
  --   "kyazdani42/nvim-web-devicons",
  --
  --   -- Time tracker
  --   "wakatime/vim-wakatime",
  --
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

  --   -- Loading spinner for lsp
  --   -- "j-hui/fidget.nvim",
  --
  --   -- Lsp statusline
  --   "nvim-lua/lsp-status.nvim",
  --
  --   -- Highlight symbols under cursor
  --   -- like vscode
  --   "RRethy/vim-illuminate",

  ----------------------------------
  -- Completions
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

  --
  --   ----------------------------------
  --   -- Snippets
  --   ----------------------------------
  --   -- Snippet engine
  --   "L3MON4D3/LuaSnip",
  --   { "rafamadriz/friendly-snippets", disable = false },
  --   ----------------------------------
  --   -- Treesitter
  --   ----------------------------------
  --   -- Treesitter engine
  --   "nvim-treesitter/nvim-treesitter",
  --
  --   "nvim-treesitter/playground",
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   "RRethy/nvim-treesitter-textsubjects",
  --   "JoosepAlviste/nvim-ts-context-commentstring",
  --   "windwp/nvim-ts-autotag",
  --
  --   ----------------------------------
  --   -- Feature improvement
  --   ----------------------------------
  --   -- Powerful autopair
  --   "windwp/nvim-autopairs",
  --
  --   -- Readline operation like shell
  --   "linty-org/readline.nvim",
  --
  --   -- Remember last place on file reopen
  --   -- (Use autocommand mkview/loadview instead)
  --   "ethanholz/nvim-lastplace",
  --
  --   -- Add more useful textobjects
  --   -- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
  --   "wellle/targets.vim",
  --
  --   -- Convert single <-> multiline code
  --   "AndrewRadev/splitjoin.vim",
  --
  --   -- Git signcolumn colored lines (like vscode)
  --   "lewis6991/gitsigns.nvim",
  --
  --   -- Better jump movements with hints
  --   "ggandor/leap.nvim",
  --
  --   -- Swap nodes using treesitter
  --   "mizlan/iswap.nvim",
  --
  --   -- Smooth scrolling
  --   "karb94/neoscroll.nvim",
  --
  --   -- Swiss-army knife of neovim plugins
  --   { "echasnovski/mini.nvim", branch = "stable" },
  --
  --   -- Keymapping popup helper
  --   "folke/which-key.nvim",
  --
  --   -- Neorg
  --   {
  --     "nvim-neorg/neorg",
  --     requires = {
  --       "nvim-neorg/neorg-telescope",
  --     },
  --   },
  --
  --   -- Pretty notification
  --   -- "rcarriga/nvim-notify",
  --
  --   -- Improve neovim input ui
  --   -- "stevearc/dressing.nvim",
  --
  --   -- Climb the syntax tree
  --   -- "drybalka/tree-climber.nvim",
  --
  --   ----------------------------------
  --   -- General
  --   ----------------------------------
  --   -- tpope
  --   "tpope/vim-surround",
  --   "tpope/vim-abolish",
  --   "tpope/vim-repeat",
  --   "tpope/vim-fugitive",
  --
  --   -- Telescope by Telescopic Johnson
  --   "nvim-telescope/telescope.nvim",
  --
  --   -- Telescope fzy sorter
  --   "nvim-telescope/telescope-fzy-native.nvim",
  --
  --   -- Telescope helper for changing directories
  --   "zane-/cder.nvim",
  --
  --   -- Project management, automate root-change
  --   "ahmedkhalf/project.nvim",
  --
  --   -- Alignment tools, good for configs
  --   "junegunn/vim-easy-align",
  --
  --   -- Show buffers at top (like tabs in vscode)
  --   "akinsho/bufferline.nvim",
  --
  --   -- Status line
  --   "nvim-lualine/lualine.nvim",
  --
  --   -- Colorize color values
  --   "norcalli/nvim-colorizer.lua",
  --
  --   -- Neo tree explorer
  --   { "nvim-neo-tree/neo-tree.nvim", requires = { "MunifTanjim/nui.nvim" } },
  --
  --   ----------------------------------
  --   -- Colorschemes
  --   ----------------------------------
  --   -- {
  --   --   "navarasu/onedark.nvim",
  --   --   "folke/tokyonight.nvim",
  --   --   "tiagovla/tokyodark.nvim",
  --   -- },
}
