local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  print "Cloning lazy.nvim..."

  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup("user.plugins")

require("lazy").setup {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-sleuth",

  "folke/tokyonight.nvim",
  "folke/neodev.nvim",
  "folke/which-key.nvim",

  "godlygeek/tabular",

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
    },
  },

  -- {
  -- 	-- Autocompletion
  -- 	"hrsh7th/nvim-cmp",
  -- 	dependencies = {
  -- 		-- Snippet Engine & its associated nvim-cmp source
  -- 		"L3MON4D3/LuaSnip",
  -- 		"saadparwaiz1/cmp_luasnip",

  -- 		-- Adds LSP completion capabilities
  -- 		"hrsh7th/cmp-nvim-lsp",

  -- 		-- Adds a number of user-friendly snippets
  -- 		"rafamadriz/friendly-snippets",
  -- 	},
  -- },

  -- { "folke/which-key.nvim", opts = {} },

  -- {
  -- 	-- Adds git related signs to the gutter, as well as utilities for managing changes
  -- 	"lewis6991/gitsigns.nvim",
  -- 	opts = {
  -- 		-- See `:help gitsigns.txt`
  -- 		signs = {
  -- 			add = { text = "+" },
  -- 			change = { text = "~" },
  -- 			delete = { text = "_" },
  -- 			topdelete = { text = "‾" },
  -- 			changedelete = { text = "~" },
  -- 		},
  -- 		on_attach = function(bufnr)
  -- 			vim.keymap.set(
  -- 				"n",
  -- 				"<leader>gp",
  -- 				require("gitsigns").prev_hunk,
  -- 				{ buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
  -- 			)
  -- 			vim.keymap.set(
  -- 				"n",
  -- 				"<leader>gn",
  -- 				require("gitsigns").next_hunk,
  -- 				{ buffer = bufnr, desc = "[G]o to [N]ext Hunk" }
  -- 			)
  -- 			vim.keymap.set(
  -- 				"n",
  -- 				"<leader>ph",
  -- 				require("gitsigns").preview_hunk,
  -- 				{ buffer = bufnr, desc = "[P]review [H]unk" }
  -- 			)
  -- 		end,
  -- 	},
  -- },

  -- {
  -- 	-- Theme inspired by Atom
  -- 	"navarasu/onedark.nvim",
  -- 	priority = 1000,
  -- 	config = function()
  -- 		vim.cmd.colorscheme("onedark")
  -- 	end,
  -- },

  -- {
  -- 	-- Set lualine as statusline
  -- 	"nvim-lualine/lualine.nvim",
  -- 	-- See `:help lualine.txt`
  -- 	opts = {
  -- 		options = {
  -- 			icons_enabled = false,
  -- 			theme = "onedark",
  -- 			component_separators = "|",
  -- 			section_separators = "",
  -- 		},
  -- 	},
  -- },

  -- {
  -- 	-- Add indentation guides even on blank lines
  -- 	"lukas-reineke/indent-blankline.nvim",
  -- 	-- Enable `lukas-reineke/indent-blankline.nvim`
  -- 	-- See `:help indent_blankline.txt`
  -- 	opts = {
  -- 		char = "┊",
  -- 		show_trailing_blankline_indent = false,
  -- 	},
  -- },

  -- -- "gc" to comment visual regions/lines
  -- { "numToStr/Comment.nvim", opts = {} },

  -- -- Fuzzy Finder (files, lsp, etc)
  -- { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },

  -- -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- -- Only load if `make` is available. Make sure you have the system
  -- -- requirements installed.
  -- {
  -- 	"nvim-telescope/telescope-fzf-native.nvim",
  -- 	-- NOTE: If you are having trouble with this installation,
  -- 	--       refer to the README for telescope-fzf-native for more instructions.
  -- 	build = "make",
  -- 	cond = function()
  -- 		return vim.fn.executable("make") == 1
  -- 	end,
  -- },

  -- {
  -- 	-- Highlight, edit, and navigate code
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	dependencies = {
  -- 		"nvim-treesitter/nvim-treesitter-textobjects",
  -- 	},
  -- 	build = ":TSUpdate",
  -- },
}
