return {
	'nvim-lualine/lualine.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	lazy = false,
	priority = 1000,
	opts = {
		options = {
			globalstatus = true,
			disabled_filetypes = { "alpha", "TelescopePrompt" }
		},
		extensions = { "neo-tree", "lazy" },
	}
}
