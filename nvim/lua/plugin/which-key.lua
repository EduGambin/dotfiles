return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup {
			icons = {
				breadcrumb = "+", -- symbol used in the command line area that shows your active key combo
				separator = "➜ ", -- symbol used between a key and it's label
				group = "~ ", -- symbol prepended to a group
			}
		}

		wk.register({
			['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
			['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
			['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
			['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
			['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
		})
	end
}
