-- Options.
vim.opt.clipboard      = "unnamedplus"
vim.opt.conceallevel   = 2
vim.opt.ignorecase     = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.scrolloff      = 3
vim.opt.shiftwidth     = 0
vim.opt.smartcase      = true
vim.opt.smartindent    = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.swapfile       = false
vim.opt.tabstop        = 2
vim.opt.termguicolors  = true
vim.opt.undofile       = true
vim.opt.cursorline     = true
vim.opt.showmode       = false
vim.opt.incsearch      = true
vim.opt.linebreak      = true
vim.opt.conceallevel   = 2
vim.opt.wrap           = false

vim.g.mapleader        = " " -- Lazy requires this to be here.

vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_python3_provider = 0")

-- When opening a file, jump to the last cursor position.
vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
