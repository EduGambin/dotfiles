return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		require("mini.ai").setup()       -- Better version of around and inside.
		require("mini.align").setup()    -- Align text.
		require("mini.bufremove").setup() -- Better version of built-in bd.
		require("mini.cursorword").setup() -- Highlight word under cursor.
		require("mini.move").setup()     -- Move lines and blocks of text.
	end
}
