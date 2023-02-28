--- Movement ---
vim.keymap.set('', 'H', '^')           -- Beginning of the line.
vim.keymap.set('', 'L', '$')           -- End of the line.
vim.keymap.set('n', '<C-h>', '<C-w>h') -- Move to left window.
vim.keymap.set('n', '<C-j>', '<C-w>j') -- Move to window below.
vim.keymap.set('n', '<C-k>', '<C-w>k') -- Move to window above.
vim.keymap.set('n', '<C-l>', '<C-w>l') -- Move to right window.

--- Functionality ---
vim.keymap.set('n', 'U', vim.cmd.redo)     -- Why is this not default.
vim.keymap.set('n', 'Y', 'y$')             -- Why is this not default.
vim.keymap.set('n', 'ñ', ':s/')            -- Quicksearch.
vim.keymap.set('n', 'Ñ', ':%s/')           -- Quicksearch (whole file).
vim.keymap.set('n', '<C-Tab>', vim.cmd.bn) -- Next buffer.
vim.keymap.set('n', '<CR>', ':')           -- Quickcommand.

vim.keymap.set('', '<leader>p', '"_dP') -- Paste without losing content.
vim.keymap.set('', '<leader>d', '"_d') -- Delete to void without copying.
