return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = "nvim-lua/plenary.nvim",
	opts = {
		defaults = {
			width = 0.95,
			height = 0.95,
			file_ignore_patterns = {
				"%.(jpg|jpeg|png|gif)", -- Image files.
				"%.pdf",
			}
		}
	}
}
