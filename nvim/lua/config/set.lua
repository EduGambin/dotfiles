-- This file was last refactored on 2023-04-06. If any option is not showing
-- here, the default value was sufficient. These options have been checked
-- through the documentation.

vim.opt.clipboard = "unnamedplus"
-- Use the system's default clipboard register.

vim.opt.conceallevel = 2
-- Allow Vim to show italic text as italic, bold as bold, etc.

vim.opt.hlsearch = false
-- Disable highlighting the search pattern.

vim.opt.ignorecase = true
-- Ignore case in search patterns.

vim.opt.lazyredraw = true
-- When this option is set, the screen will not be redrawn while executing
-- macros, registers and other commands that have not been typed.  Also,
-- updating the window title is postponed.

vim.opt.number = true
-- Print the line number in front of each line.

vim.opt.relativenumber = true
-- Show the line number relative to the line with the cursor in front of each
-- line.

vim.opt.scrolloff = 8
-- Minimal number of screen lines to keep above and below the cursor.

vim.opt.shiftwidth = 0
-- Number of spaces to use for each step of (auto)indent. When zero the 'ts'
-- value will be used.

vim.opt.smartcase = true
-- Override the 'ignorecase' option if the search pattern contains upper case
-- characters.  Only used when the search pattern is typed and 'ignorecase'
-- option is on.

vim.opt.smartindent = true
-- Do smart autoindenting when starting a new line.

vim.opt.spell = true
-- When on spell checking will be done.

vim.opt.spelllang = "es,en"
-- A comma-separated list of word list names.  When the 'spell' option is on
-- spellchecking will be done for these languages.

vim.opt.splitbelow = true
-- When on, splitting a window will put the new window below the current one.

vim.opt.splitbelow = true
-- When on, splitting a window will put the new window right of the current one.

vim.opt.swapfile = false
-- Disable swapfiles.

vim.opt.tabstop = 2
-- Number of spaces that a <Tab> in the file counts for.

vim.opt.termguicolors = true
-- Enable pretty colors.

vim.opt.textwidth = 80
-- Maximum width of text that is being inserted.  A longer line will be broken
-- after white space to get this width.

vim.opt.undofile = true
-- When on, Vim automatically saves undo history to an undo file when writing a
-- buffer to a file, and restores undo history from the same file on buffer
-- read.

vim.opt.wrap = false
-- When on, lines longer than the width of the window will wrap and displaying
-- continues on the next line.  When off lines will not wrap and only part of
-- long lines will be displayed.  When the cursor is moved to a part that is not
-- shown, the screen will scroll horizontally.

vim.cmd('language es_ES.UTF-8')
-- Change the language to Spanish using UTF-8 as encoding.

vim.cmd("colorscheme kanagawa-wave")
-- Set the colorscheme.

vim.g.tex_flavor = 'latex'
-- Detect .tex files as LaTeX files.

vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
-- When opening a file, jump to the last cursor position.

vim.cmd('set shm+=I')
-- Add the I flag to the shortmess option. This will hide the intro message.

vim.cmd('autocmd FileType * set formatoptions-=ro')
-- Remove the ro flag from the formatoptions option. This will allow Vim to
-- reformat text when pasting.
