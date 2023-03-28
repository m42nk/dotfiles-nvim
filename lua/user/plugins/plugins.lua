local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end

lazy.setup {
  ----------------------------------
  -- LSP
  ----------------------------------
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim', opts = {} }
    },
  },

  ----------------------------------
  -- Completions
  ----------------------------------
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",

      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",

    }
  },

  ----------------------------------
  -- Telescope
  ----------------------------------
  -- Telescope by Telescopic Johnson
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-fzy-native.nvim",
    }
  },

  ----------------------------------
  -- File explorer
  ----------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  ----------------------------------
  -- Treesitter
  ----------------------------------
  "nvim-treesitter/nvim-treesitter",

  "nvim-treesitter/nvim-treesitter-context",     -- Sticky header showing functions or class
  "nvim-treesitter/playground",                  -- Abstract syntax tree by treesitter
  "nvim-treesitter/nvim-treesitter-textobjects", -- Add textobjects via treesitter, currently used only for functions
  -- "RRethy/nvim-treesitter-textsubjects", -- Add "smart" textobjects, if cursor on react props, "d." will delete the props
  "JoosepAlviste/nvim-ts-context-commentstring", -- Context aware commentstring, useful for nested language like css or codeblock in markdown
  "windwp/nvim-ts-autotag",                      -- Close html/jsx tags
  "mizlan/iswap.nvim",                           -- Swap nodes using treesitter


  ----------------------------------
  -- Generic
  ----------------------------------
  "folke/which-key.nvim",      -- Keymapping popup helper
  "nvim-lualine/lualine.nvim", -- Status line
  "lewis6991/gitsigns.nvim",   -- Git tools for signcolumn and statusline components
  "folke/tokyonight.nvim",     -- Colorscheme
  "github/copilot.vim",


  ----------------------------------
  -- tpope
  ----------------------------------
  "tpope/vim-surround", -- Change surrounding
  "tpope/vim-abolish",  -- Text case aware search and replace
  "tpope/vim-repeat",   -- Something for repeating commands with '.'
  "tpope/vim-fugitive", -- Git tools
}
