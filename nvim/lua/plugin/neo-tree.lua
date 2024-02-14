return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>ef",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end,
			desc = "files",
		},
		{
			"<leader>eg",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Git"
		},
		{
			"<leader>eb",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "buffers"
		},
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			hide_root_node = true
		})
	end,
}
