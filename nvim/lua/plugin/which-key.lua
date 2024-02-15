return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.register({
			["<leader>"] = {
				name = "Plugin",
				t = { name = "Telescope" },
				e = { name = "Explorer" },
				c = { name = "Code" },
				b = {
					name = "Buffer",
					n = { "<cmd>ene<cr>", "New" }
				},
				w = {
					name = "Window",
					v = { "<cmd>vs<cr>", "Vertical new" },
					h = { "<cmd>sp<cr>", "Horizontal new" },
					c = { "<cmd>clo<cr>", "Close" },
					m = { "<cmd>on<cr>", "Maximize" }
				}
			},
			g = { name = "Goto" },
		})
	end
}
