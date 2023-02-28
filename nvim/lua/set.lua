vim.opt.relativenumber = true -- Relative line numbers.

vim.opt.tabstop     = 4    -- Size of tabulations.
vim.opt.shiftwidth  = 4    -- << and >> now work as it should.
vim.opt.smartindent = true -- Be smart about indenting.

vim.opt.wrap      = false -- No soft wrapping.
vim.opt.textwidth = 80    -- Wrap text on column 80.

vim.opt.swapfile = false -- No more swapfiles.
vim.opt.backup   = false -- No need for backup.

vim.opt.hlsearch   = false -- Don't highlight the results.
vim.opt.incsearch  = true  -- Incremental search.
vim.opt.ignorecase = true  -- Ignore case when searching...
vim.opt.smartcase  = true  -- ... except when we specify it.

vim.opt.scrolloff = 8 -- Center text (kinda).

vim.cmd('set splitbelow') -- Split below.
vim.cmd('set splitright') -- Split right.

vim.opt.gdefault       = true        -- No more 'g' flag in every fucking replace.

vim.cmd 'set termguicolors'
vim.cmd 'colorscheme dracula'

vim.cmd([[
	" Reload file at last position.
	autocmd BufRead * autocmd FileType <buffer> ++once
	\ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]])
