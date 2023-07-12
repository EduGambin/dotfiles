-- Movement among windows.
vim.keymap.set('n', '<C-Right>', '<C-w>l', {silent = true})
vim.keymap.set('n', '<C-Left>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<C-Down>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<C-Up>', '<C-w>k', {silent = true})

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

-- Copy till the end of the line.
vim.keymap.set("n", "Y", "y$")

-- Make the wildmenu behave as expected.
vim.cmd([[
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
]])

-- Movement
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Castel's quickfix.
vim.cmd('inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u')

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

-- Mappings for align.nvim.
local NS = { noremap = true, silent = true }

vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, NS)
vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS)
vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS)
vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS)

-- Mappings for NvimTree.
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', {silent = true})
