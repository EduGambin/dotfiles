local M = {}

M = {
	{
		'nvim-telescope/telescope.nvim',
		version = false,
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup({
				defaults = {
					layout_strategy = 'horizontal',
					layout_config = {
						width = 0.9,
						preview_width = 0.7
					},
					file_ignore_patterns = {
						'**.pdf'
					}
				}
			})
		end
	},

	{
		"L3MON4D3/LuaSnip",
		config = function()
			require('luasnip').setup({
				delete_check_events = 'TextChanged',
				store_selection_keys = '<Tab>',
				enable_autosnippets = true,
				history = true,
			})
			require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
		end
	},

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {},   -- Loads default behaviour
				["core.concealer"] = {},  -- Adds pretty icons to your documents
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				}, -- Completion
				["core.dirman"] = {       -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
			},
		},
		dependencies = { { "nvim-lua/plenary.nvim" } },
	}
}

return M
