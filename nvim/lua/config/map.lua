vim.keymap.set('n', 'U', vim.cmd.redo)

vim.keymap.set('n', '<C-l>', '<C-w>l', {silent = true})
vim.keymap.set('n', '<C-h>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {silent = true})

vim.keymap.set('n', '<S-l>', vim.cmd.bn, {silent = true})
vim.keymap.set('n', '<S-h>', vim.cmd.bp, {silent = true})

local toggle_fullscreen = function()
	vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end

vim.keymap.set('n', '<F11>', toggle_fullscreen, {silent = true})
vim.keymap.set('i', '<F11>', toggle_fullscreen, {silent = true})

local font_size = 12
local change_font_size = function(amount)
	font_size = font_size + amount
	vim.o.guifont = "Hack NFM:h" .. font_size
end

vim.keymap.set('n', '<C-Up>', function() change_font_size(1) end, {silent = true})
vim.keymap.set('n', '<C-Down>', function() change_font_size(-1) end, {silent = true})

vim.keymap.set('n', '<C-B>', ':NvimTreeToggle .<CR>', {silent = true})

-- This is for the wildmenu to work as you would expect.
vim.cmd([[
	cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
	cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
	cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
	cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
