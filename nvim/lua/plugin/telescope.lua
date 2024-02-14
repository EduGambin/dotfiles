return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("telescope").setup {
			defaults = {
				horizontal = {
					width = 0.95,
					height = 0.95,
					preview_width = 0.9
				}
			}
		}

		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Files' })
		vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Grep' })
		vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Buffers' })
		vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Help' })
		vim.keymap.set('n', '<leader>tk', builtin.help_tags, { desc = 'Keymaps' })
		vim.keymap.set('n', '<leader>tr', builtin.oldfiles, { desc = 'Recent' })
		vim.keymap.set('n', '<leader>tp', builtin.planets, { desc = 'Planets' })
	end,
}
