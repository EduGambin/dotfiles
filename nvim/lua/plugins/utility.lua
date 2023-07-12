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
				store_selection_keys = '<Tab>',
				enable_autosnippets = true,
				history = true,
				region_check_events = 'InsertEnter',
				delete_check_events = 'TextChanged,InsertLeave',
			})
			require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
		end
	},

	{ 'Vonr/align.nvim' },

	{
		'terrortylor/nvim-comment',
		config = function()
			require('nvim_comment').setup()
		end
	},

	{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
			require("nvim-surround").setup({

			})
    end
	},

	{
		'cameron-wags/rainbow_csv.nvim',
		config = true,
		ft = {
			'csv',
			'tsv',
			'csv_semicolon',
			'csv_whitespace',
			'csv_pipe',
			'rfc_csv',
			'rfc_semicolon'
		},
		cmd = {
			'RainbowDelim',
			'RainbowDelimSimple',
			'RainbowDelimQuoted',
			'RainbowMultiDelim'
		}
	}
}

return M
