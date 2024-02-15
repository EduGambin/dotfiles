return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = { 'nvim-tree/nvim-web-devicons', 'echasnovski/mini.nvim' },
	opts = {
		options = {
			close_command = function(n) require("mini.bufremove").delete(n, false) end,
			always_show_bufferline = false,
			offsets = {
				{
					filetype   = "neo-tree",
					text       = "~ File Explorer ~",
					highlight  = "Directory",
					separator  = true,
					text_align = "center"
				}
			}
		}
	}
}
