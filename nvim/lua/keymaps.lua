-- Set highlight on search, but clear on pressing <Esc> in normal mode.
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Upper window' })

-- Keybinds to make buffer navigation easier
vim.keymap.set("n", "L", "<cmd>bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "H", "<cmd>bp<CR>", { desc = "Previous buffer" })

-- Moving redo to a more accessible keybind.
vim.keymap.set("n", "U", "<cmd>redo<cr>", { desc = "Redo" })
