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
	opts = {
		close_if_last_window = true,
		hide_root_node = true,
		event_handlers = {
			{ -- When opening a file from the explorer, close it after.
				event = "file_opened",
				handler = function(file_path)
					require("neo-tree.command").execute({ action = "close" })
				end
			},
			{ -- Hide cursor in tree window.
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd("highlight! Cursor blend=100")
      end,
    },
    { -- Show cursor out of tree window.
      event = "neo_tree_buffer_leave",
      handler = function()
        vim.cmd("highlight! Cursor blend=0")
      end,
    }
		}
	}
}
