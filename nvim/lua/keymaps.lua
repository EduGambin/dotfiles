vim.keymap.set("n", "U", "<cmd>redo<cr>", { noremap = true, silent = true, desc = "Redo" })

vim.keymap.set("n", "L", "<cmd>bn<cr>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "H", "<cmd>bp<cr>", { noremap = true, silent = true, desc = "Previous buffer" })

vim.keymap.set("n", "<c-h>", "<c-w>h", { noremap = true, silent = true, desc = "Window left" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { noremap = true, silent = true, desc = "Window below" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { noremap = true, silent = true, desc = "Window above" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { noremap = true, silent = true, desc = "Window right" })

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { noremap = true, silent = true, desc = "No highlight" })
