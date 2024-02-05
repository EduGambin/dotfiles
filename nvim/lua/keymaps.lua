local NS = { noremap = true, silent = true }

vim.keymap.set("n", "U", ":redo<CR>", NS)
vim.keymap.set("n", "L", ":bn<CR>", NS)
vim.keymap.set("n", "H", ":bp<CR>", NS)
vim.keymap.set("n", "<C-h>", "<C-w>h", NS)
vim.keymap.set("n", "<C-j>", "<C-w>j", NS)
vim.keymap.set("n", "<C-k>", "<C-w>k", NS)
vim.keymap.set("n", "<C-l>", "<C-w>l", NS)

-- Disable spacebar in normal mode.
vim.keymap.set("n", "<Space>", "<Nop>", NS)
