vim.keymap.set("n", "U", ":redo<CR>",             { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("n", "L", ":bn<CR>",               { noremap = true, silent = true, desc = "Next buffer"})
vim.keymap.set("n", "H", ":bp<CR>",               { noremap = true, silent = true, desc = "Previous buffer"})
vim.keymap.set("n", "<C-h>", "<C-w>h",            { noremap = true, silent = true, desc = "Window left"})
vim.keymap.set("n", "<C-j>", "<C-w>j",            { noremap = true, silent = true, desc = "Window below"})
vim.keymap.set("n", "<C-k>", "<C-w>k",            { noremap = true, silent = true, desc = "Window above"})
vim.keymap.set("n", "<C-l>", "<C-w>l",            { noremap = true, silent = true, desc = "Window right"})

vim.keymap.set("n", "<leader>bn", "<cmd>vne<cr>", { noremap = true, silent = true, desc = "New"})

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>",      { noremap = true, silent = true, desc = "No highlight"})
