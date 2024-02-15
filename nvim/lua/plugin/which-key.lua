return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")

		wk.setup {
			icons = {
				breadcrumb = "+", -- symbol used in the command line area that shows your active key combo
				separator = "➜ ", -- symbol used between a key and it's label
				group = "~ ", -- symbol prepended to a group
			}
		}

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
