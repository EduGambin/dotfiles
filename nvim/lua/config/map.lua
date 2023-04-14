-- Movement among windows.
vim.keymap.set('n', '<C-l>', '<C-w>l', {silent = true})
vim.keymap.set('n', '<C-h>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {silent = true})

-- Movement among buffers.
vim.keymap.set('n', 'L', vim.cmd.bn, {silent = true})
vim.keymap.set('n', 'H', vim.cmd.bp, {silent = true})

-- Movement through the lines.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {silent = true})

-- Center the view after some commands.
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Redo to it's natural position.
vim.keymap.set("n", "U", "<cmd>:redo<cr>")

-- Mappings for Telescope.
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Mappings for LuaSnip.
vim.cmd([[
	" press <Tab> to expand or jump in a snippet. These can also be mapped separately
	" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
	imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
	" -1 for jumping backwards.
	inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

	snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
	snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

	" For changing choices in choiceNodes (not strictly necessary for a basic setup).
	imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
	smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])
