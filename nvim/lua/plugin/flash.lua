return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{ "<c-s>", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash Search" },
		{ "<c-t>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" }
	},
}
