return {
	"lukas-reineke/indent-blankline.nvim",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"neo-tree",
				"mason",
				"notify",
			},
		},
	},
	main = "ibl",
}
