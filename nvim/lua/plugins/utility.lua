local M = {}

M = {
	{
		'nvim-telescope/telescope.nvim',
		version = false,
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

	{
		"L3MON4D3/LuaSnip",
		config = function()
			require('luasnip').setup({
				delete_check_events = 'TextChanged',
				enable_autosnippets = true,
				history = true,
			})
			require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
		end
	}
}

return M
