-- Set <space> as the leader key. This must be done before plugins are loaded, otherwise the wrong leader will be used.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set line numbers and relative line numbers.
vim.opt.number = true
vim.opt.relativenumber = true
--
-- Enable mouse mode in all contexts.
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent (wrap lines at the same indent level as the line above or below it).
vim.opt.breakindent = true

-- Wrap lines at a word boundary.
vim.opt.linebreak = true

-- Enable persistent undo.
vim.opt.undofile = true

-- Case insensitive searching UNLESS \C or capital in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default (it looks weird when toggling it).
vim.opt.signcolumn = "yes"

-- Decrease update time.
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure the split behavior.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
--
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on.
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
