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
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },

  ----------------------------------
  -- Generic
  ----------------------------------
  "folke/which-key.nvim", -- Keymapping popup helper

  ----------------------------------
  -- tpope
  ----------------------------------
  "tpope/vim-surround", -- Change surrounding
  "tpope/vim-abolish",  -- Text case aware search and replace
  "tpope/vim-repeat",   -- Something for repeating commands with '.'
  "tpope/vim-fugitive", -- Git tools
}
