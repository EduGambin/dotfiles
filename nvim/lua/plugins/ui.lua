local M = {}
M = {
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
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
	}
}

return M
