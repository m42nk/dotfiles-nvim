-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'               -- Enable mouse support
opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
opt.swapfile = false          -- Don't use swapfile
opt.wrap = false              -- Linewrap
opt.scrolloff = 8             -- Scroll offset
opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options
opt.undofile = true           -- Persistent undo

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true         -- Show line number
opt.relativenumber = true -- Show relative line number
opt.showmatch = true      -- Highlight matching parenthesis
opt.colorcolumn = '80'    -- Line length marker at 80 columns
opt.splitright = true     -- Vertical split to the right
opt.splitbelow = true     -- Horizontal split to the bottom
opt.ignorecase = true     -- Ignore case letters when search
opt.smartcase = true      -- Ignore lowercase for the whole pattern
opt.linebreak = true      -- Wrap on word boundary
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.laststatus = 3        -- Set global statusline
opt.hlsearch = true       -- Highlight search
opt.conceallevel = 0      -- Make `` visible in markdown
opt.cursorline = true     -- Highlight current line
opt.signcolumn = "yes"    -- Always show the sign columns (diagnostics, etc)
opt.showmode = false      -- Hide mode in cmdline "-- INSERT --"

opt.foldmethod = 'marker' -- Enable folding (default 'foldmarker')
-- opt.foldlevel = 0


-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- Use spaces instead of tabs
opt.shiftwidth = 2        -- Shift 2 spaces when tab
opt.tabstop = 2           -- 1 tab == 2 spaces
opt.smartindent = true    -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- Enable background buffers
opt.history = 100         -- Remember N lines in history
opt.lazyredraw = true     -- Faster scrolling
opt.synmaxcol = 240       -- Max column for syntax highlight
opt.updatetime = 700      -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"
