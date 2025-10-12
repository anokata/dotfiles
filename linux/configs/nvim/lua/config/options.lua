-- vim.g.mapleader = ","
-- vim.g.maplocalleader = ";"
vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme tokyonight-night]])
-- vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[colorscheme carbonfox]])

vim.opt.tabstop = 4 -- The width of a <Tab> character
vim.opt.shiftwidth = 4 -- The number of spaces to use for auto-indent
vim.opt.softtabstop = 4 -- The number of spaces <Tab>/<BS> count for in Insert mode
vim.opt.expandtab = true

-- General Behavior
vim.opt.autochdir = true -- Change Neovim's current directory to the current buffer's file directory
vim.opt.autoread = true -- Automatically read files when changed outside of Neovim
vim.opt.hidden = true -- Allow switching buffers without saving (buffers become hidden)
vim.opt.cmdheight = 2 -- Give the command line two lines
vim.opt.laststatus = 2 -- Always show the status line (2)
vim.opt.lazyredraw = true -- Don't redraw the screen while executing macros or scripts (faster)
-- vim.opt.nocompatible = false -- IMPORTANT: Enable Neovim/Vim features (required for modern configs)

-- Search
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.iminsert = 0 -- Disable any input method (IM) when entering insert mode
vim.opt.imsearch = 0 -- Disable any IM when starting a search

-- Clipboard
vim.opt.clipboard = "unnamed" -- Use system clipboard for all normal operations (*)
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for all normal operations (+)

-- Display
vim.opt.number = true -- Show line numbers

-- Indentation & Tabs
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.expandtab = true -- Use spaces instead of tabs (crucial for consistent indentation)

-- Folding
vim.opt.foldenable = true -- Enable folding
vim.opt.foldlevel = 20 -- Close folds at this level (20 keeps them mostly open)
vim.opt.foldlevelstart = 20 -- The initial fold level for new buffers
vim.opt.foldmethod = "syntax" -- Use syntax highlighting to determine folds

-- Syntax/Aesthetics
vim.opt.conceallevel = 1 -- Show concealable characters partially (e.g., Markdown italics)

vim.opt.smarttab = true -- Smartly use softtabstop, shiftwidth, and tabstop settings
-- Note: You have 'shiftwidth=4' twice; Lua only needs it once.

-- Search
vim.opt.smartcase = true -- Override 'ignorecase' when search pattern contains uppercase letters

-- Scrolling
vim.opt.scrolloff = 1 -- Minimum number of screen lines to keep above or below the cursor
vim.opt.sidescrolloff = 5 -- Minimum number of columns to keep right or left of the cursor

-- Display Characters
vim.opt.list = true -- Show unprintable characters
vim.opt.listchars = {
    tab = "> ", -- Tab characters displayed as '> '
    trail = "-", -- Trailing spaces displayed as '-'
    extends = ">", -- Character shown when line is truncated (right)
    precedes = "<", -- Character shown when line is truncated (left)
    nbsp = "+", -- Non-breaking space displayed as '+'
}
vim.opt.numberwidth = 4 -- Minimum width of the line number column

-- Terminal Colors
vim.opt.termguicolors = true -- (Recommended, ensure you have this too) Enables 24-bit true color

-- Navigation
vim.opt.switchbuf = "usetab" -- When jumping, prefer switching to an existing tab/window

-- Line Wrap
vim.opt.textwidth = 0 -- No auto line wrapping/breaking
vim.opt.wrap = false -- Do not soft-wrap lines visually
vim.opt.wrapmargin = 0 -- Disable wrap margin

-- Command Line
vim.opt.wildmenu = true -- Show command line completion as a menu
vim.opt.wildmode = "longest:list,full" -- Completion behavior: longest match, then list options, then full match
vim.opt.showmode = false -- Disables the display of the current mode (e.g., -- INSERT --)

vim.opt.langmap =
    "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
