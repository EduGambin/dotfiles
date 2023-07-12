local M = {}
M = {
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd('colorscheme kanagawa')
		end
	},

	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = true
	},

	{
		'akinsho/bufferline.nvim',
		version = "v3.*",
		lazy = false,
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = function()
			require('bufferline').setup({
				options = {
					diagnostics = "nvim_lsp"
				}
			})
		end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup {
				-- for example, context is off by default, use this to turn it on
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	}
}

return M
