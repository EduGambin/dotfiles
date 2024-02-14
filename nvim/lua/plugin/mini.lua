return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		require("mini.ai").setup()
		require("mini.align").setup()
		require("mini.bufremove").setup()
		vim.keymap.set("n", "<leader>bd", require("mini.bufremove").delete, { desc = "Delete" })

		require("mini.comment").setup()
		require("mini.cursorword").setup()
		require("mini.indentscope").setup({
			symbol = "│"
		})
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.splitjoin").setup()
		require("mini.surround").setup()
		require("mini.trailspace").setup()
	end
}
