return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically.

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},

	{ -- Highlight todo, notes, etc in comments.
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", lazy = true }, -- For icons.
		},
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true, -- Show the same statusline on all windows.
					disabled_filetypes = { "alpha" }, -- Don't show statusline on start screen.
				},
				extensions = { "lazy", "neo-tree" },
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", lazy = true }, -- For icons.
		},
		event = "VeryLazy",
		config = function()
			local closeFunction = function(n)
				require("mini.bufremove").delete(
					n, -- Buffer number.
					false -- Don't force close.
				)
			end

			require("bufferline").setup({
				options = {
					close_command = closeFunction,
					right_mouse_command = closeFunction,
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "neo-tree",
							text = "════════ File Explorer ════════",
							text_align = "center",
							separator = true,
						},
					},
					separator_style = "slant",
					always_show_bufferline = false,
				},
			})

			-- Keybinds to make buffer navigation easier
			vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
		end,
	},
}

-- vim: ts=4 sw=0 et
