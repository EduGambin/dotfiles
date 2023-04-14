local M = {}

M = {
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
	},

	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = true
	},

	{
		'akinsho/bufferline.nvim',
		version = "v3.*",
		event = "VeryLazy",
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = true
	},

	{
		'KeitaNakamura/tex-conceal.vim',
		config = function()
			vim.g.tex_conceal = 'abdgm'
			vim.g.tex_conceal_frac = 1
		end
	}
}

return M
